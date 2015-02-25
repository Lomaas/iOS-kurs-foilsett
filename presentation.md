# Swift-kurs

---

## Agenda

1. Om Bekk
2. Swift
3. Xcode
4. Lunch
5. Koding og presentasjon
6. Oppsummering
7. Mat og drikke

---

## Om Bekk

- Konsulentfirma
- Hovedkontor i Oslo
- IT, design og økonomi



---

## Swift

- Tar over for Objective-C
- For iOS og OSX
- Lavere terkel å komme i gang
- OOP, funksjonelt, imperativ
- Forbedres stadig

---

## Syntax

```swift
println("Hello, world!")
```
---

## Variabler og konstanter

```swift	
var students = 100
let shortName = "UiT"
let universities = "UiT", "UiB", "NTNU"
```

---

## for-løkker

```swift
var jobber = ["CSS-guru", "Designer", "Backend-utvikler"]

for jobb in jobber {
	println("\(jobb)")
}

for number in 0..100 {
	println("\(number)")
}
```

---

## Funksjoner
```swift
func addTwo(a: Int) -> Int {
	return a + 2
}

let number = addTwo(5)  // 7
```

---

## Closures

```swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
	return s1 > s2
}

var reversed = sorted(names, backwards)

// reversed is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
```

---

## Klasser 

```swift
class VideoMode {
      var resolution = Resolution()
      var interlaced = false
      var frameRate = 0.0
      var name: String?

      // Funksjoner her
 }
 ```

 ---

## iOS

- OS for iPad, iPhone, and iPod
- Cocoa Touch
- Masse rammeverk: Push, Message, UIkit, Adresss Book
