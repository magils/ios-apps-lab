//
//  Data.swift
//  LittleRestaurantReservation
//
//  Created by Moises Gil on 12/13/25.
//

import Foundation

struct Data {
    let shops = [
        ShopLocation(city: "San Francisco", address: "NV 33, Los Gatos", phoneNumber: "415-886-4514"),
        ShopLocation(city: "New York", address: "5th Ave.", phoneNumber: "375-846-4514"),
        ShopLocation(city: "Los Angeles", address: "NV 33, Los Gatos", phoneNumber: "415-886-4514"),
    ]
    let carBrands: [String] = [
        // American
        "Chevrolet", "Ford", "GMC", "Cadillac", "Buick", "Dodge", "Ram", "Jeep",
        "Chrysler", "Lincoln", "Tesla", "Rivian", "Lucid",
        
        // German
        "Audi", "BMW", "Mercedes-Benz", "Volkswagen", "Porsche", "Opel", "Smart",
        
        // Japanese
        "Toyota", "Honda", "Nissan", "Mazda", "Subaru", "Mitsubishi", "Suzuki",
        "Lexus", "Infiniti", "Acura", "Isuzu", "Daihatsu",
        
        // Korean
        "Hyundai", "Kia", "Genesis", "SsangYong",
        
        // Italian
        "Ferrari", "Lamborghini", "Maserati", "Alfa Romeo", "Fiat", "Lancia",
        
        // British
        "Aston Martin", "Bentley", "Jaguar", "Land Rover", "Lotus", "McLaren",
        "Rolls-Royce", "Mini", "MG",
        
        // French
        "Peugeot", "Renault", "Citroën", "DS", "Bugatti", "Alpine",
        
        // Swedish
        "Volvo", "Saab", "Polestar", "Koenigsegg",
        
        // Spanish
        "SEAT", "Cupra",
        
        // Czech
        "Skoda",
        
        // Romanian
        "Dacia",
        
        // Chinese
        "BYD", "Geely", "Great Wall", "Chery", "NIO", "Xpeng", "Li Auto",
        "Hongqi", "Lynk & Co", "MG Motor", "Changan", "JAC", "Dongfeng",
        
        // Indian
        "Tata", "Mahindra",
        
        // Malaysian
        "Proton", "Perodua",
        
        // Russian
        "Lada", "GAZ",
        
        // Luxury/Specialty
        "Maybach", "Pagani", "Koenigsegg",
        
        // Historic/Legacy (still recognized)
        "Pontiac", "Saturn", "Hummer", "Mercury", "Plymouth", "Oldsmobile"
    ]
    
    let carModelsByBrand: [String: [String]] = [
        // American
        "Chevrolet": ["Silverado", "Equinox", "Tahoe", "Suburban", "Traverse", "Malibu", "Camaro", "Corvette", "Blazer", "Trailblazer", "Trax", "Colorado", "Bolt EV", "Bolt EUV"],
        
        "Ford": ["F-150", "F-250", "F-350", "Mustang", "Explorer", "Escape", "Edge", "Expedition", "Bronco", "Bronco Sport", "Ranger", "Maverick", "Mustang Mach-E", "Transit", "EcoSport"],
        
        "GMC": ["Sierra 1500", "Sierra 2500", "Sierra 3500", "Terrain", "Acadia", "Yukon", "Yukon XL", "Canyon", "Hummer EV"],
        
        "Cadillac": ["Escalade", "Escalade ESV", "XT4", "XT5", "XT6", "CT4", "CT5", "Lyriq", "Celestiq"],
        
        "Buick": ["Encore", "Encore GX", "Envision", "Enclave"],
        
        "Dodge": ["Charger", "Challenger", "Durango", "Hornet"],
        
        "Ram": ["1500", "2500", "3500", "ProMaster", "ProMaster City"],
        
        "Jeep": ["Wrangler", "Grand Cherokee", "Cherokee", "Compass", "Renegade", "Gladiator", "Grand Wagoneer", "Wagoneer"],
        
        "Chrysler": ["Pacifica", "300"],
        
        "Lincoln": ["Navigator", "Aviator", "Corsair", "Nautilus"],
        
        "Tesla": ["Model S", "Model 3", "Model X", "Model Y", "Cybertruck"],
        
        "Rivian": ["R1T", "R1S"],
        
        "Lucid": ["Air"],
        
        // German
        "Audi": ["A3", "A4", "A5", "A6", "A7", "A8", "Q3", "Q4 e-tron", "Q5", "Q7", "Q8", "e-tron", "TT", "R8"],
        
        "BMW": ["2 Series", "3 Series", "4 Series", "5 Series", "7 Series", "8 Series", "X1", "X2", "X3", "X4", "X5", "X6", "X7", "iX", "i4", "i7", "Z4", "M2", "M3", "M4", "M5", "M8"],
        
        "Mercedes-Benz": ["A-Class", "C-Class", "E-Class", "S-Class", "GLA", "GLB", "GLC", "GLE", "GLS", "G-Class", "EQE", "EQS", "AMG GT", "SL", "CLA", "CLS"],
        
        "Volkswagen": ["Jetta", "Passat", "Arteon", "Tiguan", "Atlas", "Taos", "ID.4", "Golf", "GTI", "Golf R"],
        
        "Porsche": ["911", "Taycan", "Panamera", "Cayenne", "Macan", "718 Boxster", "718 Cayman"],
        
        // Japanese
        "Toyota": ["Camry", "Corolla", "Avalon", "RAV4", "Highlander", "4Runner", "Sequoia", "Tacoma", "Tundra", "Prius", "Crown", "GR86", "Supra", "Sienna", "bZ4X", "C-HR", "Venza", "Mirai"],
        
        "Honda": ["Civic", "Accord", "CR-V", "HR-V", "Pilot", "Passport", "Ridgeline", "Odyssey", "Insight"],
        
        "Nissan": ["Sentra", "Altima", "Maxima", "Versa", "Rogue", "Murano", "Pathfinder", "Armada", "Frontier", "Titan", "Kicks", "Ariya", "Z", "GT-R", "Leaf"],
        
        "Mazda": ["Mazda3", "Mazda6", "CX-30", "CX-5", "CX-50", "CX-9", "CX-90", "MX-5 Miata"],
        
        "Subaru": ["Impreza", "Legacy", "Outback", "Forester", "Crosstrek", "Ascent", "WRX", "BRZ", "Solterra"],
        
        "Mitsubishi": ["Mirage", "Outlander", "Outlander Sport", "Eclipse Cross"],
        
        "Lexus": ["ES", "IS", "LS", "UX", "NX", "RX", "GX", "LX", "LC", "RC"],
        
        "Infiniti": ["Q50", "Q60", "QX50", "QX55", "QX60", "QX80"],
        
        "Acura": ["ILX", "Integra", "TLX", "RDX", "MDX", "NSX"],
        
        // Korean
        "Hyundai": ["Elantra", "Sonata", "Accent", "Venue", "Kona", "Tucson", "Santa Fe", "Palisade", "Ioniq 5", "Ioniq 6", "Santa Cruz", "Veloster", "Nexo"],
        
        "Kia": ["Forte", "K5", "Stinger", "Rio", "Soul", "Seltos", "Sportage", "Sorento", "Telluride", "Niro", "EV6", "EV9", "Carnival"],
        
        "Genesis": ["G70", "G80", "G90", "GV60", "GV70", "GV80"],
        
        // Italian
        "Ferrari": ["Roma", "Portofino", "296 GTB", "F8 Tributo", "SF90 Stradale", "812 Superfast", "Purosangue"],
        
        "Lamborghini": ["Huracán", "Urus", "Revuelto"],
        
        "Maserati": ["Ghibli", "Quattroporte", "Levante", "MC20", "Grecale"],
        
        "Alfa Romeo": ["Giulia", "Stelvio", "Tonale"],
        
        "Fiat": ["500", "500X"],
        
        // British
        "Aston Martin": ["Vantage", "DB12", "DBS", "DBX"],
        
        "Bentley": ["Continental GT", "Flying Spur", "Bentayga"],
        
        "Jaguar": ["XE", "XF", "F-Type", "E-Pace", "F-Pace", "I-Pace"],
        
        "Land Rover": ["Defender", "Discovery", "Discovery Sport", "Range Rover", "Range Rover Sport", "Range Rover Velar", "Range Rover Evoque"],
        
        "Lotus": ["Emira", "Eletre"],
        
        "McLaren": ["Artura", "GT", "720S", "765LT"],
        
        "Rolls-Royce": ["Ghost", "Phantom", "Cullinan", "Spectre"],
        
        "Mini": ["Cooper", "Countryman", "Clubman"],
        
        // French
        "Peugeot": ["208", "308", "508", "2008", "3008", "5008"],
        
        "Renault": ["Clio", "Megane", "Captur", "Kadjar", "Koleos", "Talisman"],
        
        "Citroën": ["C3", "C4", "C5 Aircross"],
        
        // Swedish
        "Volvo": ["S60", "S90", "V60", "V90", "XC40", "XC60", "XC90", "C40 Recharge", "EX30", "EX90"],
        
        "Polestar": ["2", "3", "4"],
        
        // Chinese
        "BYD": ["Seal", "Atto 3", "Dolphin", "Han", "Tang", "Song"],
        
        "NIO": ["ET5", "ET7", "ES6", "ES7", "ES8"],
        
        "Xpeng": ["P5", "P7", "G3", "G9"],
        
        "Geely": ["Coolray", "Azkarra", "Okavango"],
        
        // Indian
        "Tata": ["Nexon", "Harrier", "Safari", "Altroz"]
    ]
}
