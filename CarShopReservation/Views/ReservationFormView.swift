//
//  ReservationFormView.swift
//  CarShopReservation
//
//  Created by Moises Gil on 12/14/25.
//

import SwiftUI

struct ReservationFormView: View {
    let location: ShopLocation

    private let data = Data()
    private let reservationController = ReservationController.shared // TODO: Rename this controller to AppointmentController
    
    @State private var customerFullName = ""
    @State private var customerEmail = ""
    @State private var customerPhoneNumber = ""
    @State private var carBrand = ""
    @State private var carModel = ""
    @State private var carYear = 0
    @State private var carMileageInput = ""
    @State private var serviceType = ""
    @State private var customerStatement = ""
    @State private var reservationDate = Date()
    @State private var isUnknownCarBrand = false
    @State private var unknowCar = ""
    @State private var validationError: ValidationError?
    @State private var isAppointmentScheduleCompleted = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Customer Information")) {
                    TextField("Full Name", text: $customerFullName)
                    TextField("Email", text: $customerEmail)
                        .keyboardType(.emailAddress)
                    TextField("Phone Number", text: $customerPhoneNumber)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Car Information")) {
                    
                    if !isUnknownCarBrand{                        
                        Picker(selection: $carBrand, label: Text("Brand")) {
                            ForEach(data.carBrands, id: \.self) { brand in
                                Text(brand)
                            }
                        }
                        
                        Picker(selection: $carModel, label: Text("Model")) {
                            ForEach(data.carModelsByBrand[carBrand] ?? ["Unknown"], id: \.self) { model in
                                Text(model)
                            }
                        }
                        
                        Picker(selection: $carYear, label: Text("Year")) {
                            let currentYear = Calendar.current.dateComponents([.year], from: Date()).year ?? 2050
                            ForEach((1960...currentYear).reversed(), id:\.self) { year in
                                Text(verbatim: "\(year)")
                            }
                        }
                        
                    }
                    
                    Toggle(isOn: $isUnknownCarBrand) {
                        Text("My car is not in the list")
                    }.onChange(of: isUnknownCarBrand) { newValue in
                        resetCarInformationFields()
                    }
                    
                    HStack{
                        Text("Mileage")
                        TextField("Mileage", text: $carMileageInput)
                            .keyboardType(.numberPad)
                        Text("Mi.")
                    }
                    
                    if isUnknownCarBrand{
                        TextField("Type your car here: [Year] [Brand] [Model]", text: $unknowCar).disabled(!isUnknownCarBrand)
                    }
                }
                
                Section(header: Text("Service Details")) {
                    Picker(selection: $serviceType, label: Text("Service Type")){
                        ForEach(ServiceType.allCases.map{ $0.rawValue }, id: \.self) { service in
                            Text(service)
                        }
                    }
                    
                    DatePicker(selection: $reservationDate, in: Date()..., displayedComponents: [.date, .hourAndMinute]) {
                        Text("Service Date")
                    }
                    
                    VStack(alignment: .leading){
                        Text("Customer states...")
                        
                        TextEditor(text: $customerStatement)
                            .font(.custom("Menlo", size: 14))
                            .frame(height: 120)
                    }
                }
            }.navigationTitle("New appointment")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Reserve") {
                        createReservation()
                    }
                }
            }
            .alert(item: $validationError) { error in
                Alert(
                    title: Text("Error"),
                    message: Text(error.localizedDescription),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .alert(isPresented: $isAppointmentScheduleCompleted) {
            Alert(
                title: Text("Appointment scheduled"),
                message: Text("Your reservation has been scheduled successfully."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    func resetCarInformationFields() {
        carBrand = ""
        carModel = ""
        carYear = 0
        unknowCar = ""
    }
    
    func validateData() throws {
        if customerFullName.isEmpty {
            throw ValidationError.emptyField(fieldName: "Customer Full Name")
        }
        
        if customerEmail.isEmpty {
            throw ValidationError.emptyField(fieldName: "Customer Email")
        }
        
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+\\.[\\p{L}0-9-]{2,}(?:\\.[\\p{L}0-9-]{2,})*$"
        let emailValidationPredicate  = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        
        if !emailValidationPredicate.evaluate(with: customerEmail) {
            throw ValidationError.invalidEmail(email: customerEmail)
        }
        
        if customerPhoneNumber.isEmpty{
            throw ValidationError.emptyField(fieldName: "Customer Phone Number")
        }
        
        if customerPhoneNumber.count < 10 {
            throw ValidationError.invalidPhoneNumber(phoneNumber: customerPhoneNumber)
        }
        
        if !isUnknownCarBrand && carBrand.isEmpty {
            throw ValidationError.emptyField(fieldName: "Car brand")
        }
        
        if !isUnknownCarBrand && carYear == 0 {
            throw ValidationError.emptyField(fieldName: "Car year")
        }
        
        if !isUnknownCarBrand && carModel.isEmpty {
            throw ValidationError.emptyField(fieldName: "Car model")
        }
        
        if isUnknownCarBrand && unknowCar.isEmpty {
            throw ValidationError.emptyField(fieldName: "Unknown Car details")
        }
        
        if serviceType.isEmpty {
            throw ValidationError.emptyField(fieldName: "Service Type")
        }
    }
    
    func createReservation() {
        
        do {
            try validateData()
            
            let customer = Customer(fullName: customerFullName,  phoneNumber: customerPhoneNumber, email: customerEmail)
            let car = Car(brand: carBrand, model: carModel, year: carYear, isUnknown: isUnknownCarBrand, unknownName: unknowCar, mileage: Int(carMileageInput) ?? 0)
            let serviceDetail = ServiceDetail(serviceType: ServiceType(rawValue: serviceType) ?? .other, customerStatement: customerStatement)
            let reservation = Appointment(customer: customer, reservationDate: reservationDate, car: car, serviceDetail: serviceDetail, shopLocation: location)
            
            self.reservationController.addReservation(reservation)
            
            isAppointmentScheduleCompleted = true

        } catch let error as ValidationError {
            validationError = error
        } catch {
            print("Unknown error: \(error)")
        }
    }
    
    
}

#Preview {
    ReservationFormView(location: ShopLocation(city: "San Francisco", address: "NV 33, Los Gatos", phoneNumber: "415-886-4514"))
}
