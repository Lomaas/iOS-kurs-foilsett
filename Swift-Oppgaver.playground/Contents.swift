import Foundation


// Oppgave 1: Lag en funksjon som skriver ut alle prosjektrollene
let prosjektroller = ["CSS-guru", "Designer", "Backend", "Frontend", "Full stack"]

for roller in prosjektroller {
    print(roller)
}

// Oppgave 2: Lag en funksjon som sjekker om et heltall er et partall

func isEven(num: UInt32) -> Bool {
    return num%2 == 0
}



// Oppgave 3: Lag en funksjon som tar inn en liste av tall og
// returnerer en liste der bare partallene er med (bruk funksjonen fra forrige oppgave)
// a - implementer ved å appende partall til en liste
// b - implementer ved å bruke Array sin .filter()
let randomTall = [arc4random(), arc4random(), arc4random(), arc4random(), arc4random(), arc4random()]

randomTall.filter(isEven)

// Oppgave 4: Bruk Array sin .sort til å sortere tallene under i stigende rekkefølge.
// Steg 2: ta i bruk $-syntaks
let tall = [1, 3, 2, 4, 6, 10, 8, 9, 7, 5]

tall.sort(>)

// Oppgave 5: Lag en funksjon "hellom" som tar inn et navn av typen Optional String hvor
// hello("Aleksander") returnerer "Hello Aleksander"
// hello(nil) returnerer "Hello World"

func hello(name: String?) -> String {
    return "Hello " + (name ?? "World")
}

hello("simen")
hello(nil)

// Oppgave 6: Lag en funksjon som dividerer to heltall.
// Funksjonen bør returnere nil/.None hvis nevneren er 0

func divideEven(teller: Int, nevner: Int) -> Int? {
    if nevner == 0 {
        return nil
    }
    
    return teller/nevner
}

divideEven(5, nevner: 0)
divideEven(5, nevner: 1)

// Oppgave 7: Lag en extension til Array som tilbyr forEach funksjonalitet - altså kaller en funksjon for hvert element i listen.
// Se Swift Documentation -> Language Guide for info om extensions

extension Array {
    func myMap(inputFunction: (elem: T) -> T) -> Array<T> {
        var arr = Array<T>()
        
        for x in self {
            arr.append(inputFunction(elem: x))
        }
        return arr
    }
    
    func forEach(inputFunction: (elem: T) -> Void) {
        for x in self {
            inputFunction(elem: x)
        }
    }
}

tall.forEach { (elem) -> Void in
    print("\(elem)")
}



// Oppgave 8: Bruk Language Guide til å lese om og utforske mer om Swift
// Forslag: "Classes and Structs", "Optional Chaining", "Automatic Reference Counting"
