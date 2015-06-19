# Oppgaver

- Lage en Todo-app for iOS
Spec:

1. Liste opp todos
2. Lag ny
3. Swipe to delete
4. Click to edit
5. Tag todo med lokasjon
6. Søk på todos
7. Få notifikasjon når du er nært en todo

---

# 1: Storyboard

- Start i Main.storyboard
![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/storyboard.png?raw=true)
- Dra ut Table View
- Sett på constraints (hug top, bunn, og sidene)
- Dra inn referanse til tableView
![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/ctrldrag.png?raw=true)


# Custom table view cell

- Vi skal ha en spesialsydd celle. 
- Velg at du skal ha 1 prototype celle ved å velge tableView i storyboard, 
![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/protoypecell.png?raw=true)

- Sett identifer og klasse for protoype cell.

![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/customcell.png?raw=true)

- Du må opprette en ny klasse som blir din TableViewCell (cmd + n). Velg Swift-fil. Den nye klassen må extende UITableViewCell. Husk å importere UIKit

![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/customclass.png?raw=true)

- Eksempel på hvordan en TodoViewCell kan se ut som:

![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/exampleViewCell.png?raw=true)

- Husk at du må sette på constraints for view-elementer i cellen

# ViewController og  tableView

- Lag et array med fake data til å starte med for å teste presentasjonen av dataen
- Sett delegate til tableView til å være self og implementer tableView delegate metodene

```swift
tableView.delegate = self
```

- Implementer delegate og dataSource:

```swift
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
    }
}
```

- Tips for å populere TodoTableViewCell:

```swift
let cell = tableView.dequeueReusableCellWithIdentifier("todoCell") as! TodoTableViewCell
let todo = tableData[indexPath.row]

// sett data på celle og return cell

```

- Vi har bare en section. En tabell med flere sections er f. eks innstillinger:

![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/tableviewwithsections.png?raw=true)

---

# 2: Opprett Todo

- Legg til BarButton knapp oppe i høyre hjørne på navigation baren
- ctrl-click og dra over i ny ViewController. Velg "push" som animasjonstype

![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/dragtonewview.png?raw=true)

- Lag user interface i Storyboard for opprettelse av todo etter ønske. F. eks et textfield, date picker og en save knapp
- Ved opprettelse av todo, gi beskjed at ny data er kommet til TableViewController ved bruk av delegate pattern

```swift

protocol NewTodoViewControllerDelegate {
	func didCreateTodo(todo: Todo)
}

// TableViewController -> sett delegate i prepareForSegue
// Implementer didCreateTodo

- I din Opprett Todo legg i din
```swift
var delegate: TodoViewControllerProtocol?
delegate?.didAddNewTodo()

```

```

- Gi beskjed til navigationController at den skal poppe et view fra stacken:
```swift
navigationController?.popViewController
```

- Tips for UITextField. Implementer delegates for fjerne keyboard popup

```swift
extension TodoViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {

    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {

    }
}

```

---

# 3: Swipe to delete todo

```swift

override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
	return true
}
```

```swift
func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
	if (editingStyle == UITableViewCellEditingStyle.Delete) {
		// Do action
	}

```

# 4: Click to edit

- Gjenbruk din implementasjon av create new todo til å støtte edit av todo også.
- Implementer i didSelectRowAtIndexPath i TableViewController for å håndtere klikk på en celle:

```swift
func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
	peformSeugueWithIdentifier()
}
```
- For å sende med data til neste viewController. Overskriv prepareForSegue. Denne blir kalt i det transisjonen til neste view skal gjøres

```swift
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "goToTodoViewController" {
        let vc = segue.destinationViewController as! TodoViewController

        // configurer vc med data

    }
}
```

---

# 5: Utvid opprett/edit todo til å støtte lokasjon

- Gå til prosjekt settings, velg tab "General". Gå til Linked Frameworks and Libraries og legg til CoreLocation & MapKit frameworks

![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/addframeworks.png?raw=true)

- Du må også sette en key i din .plist -fil

![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/plist.png?raw=true)


- Dra in Map Kit View inn i din view controller i storyboard
- Bruk MKAnnotationView for å sette lokasjon på kartet. Du må bruke CLLocationManager for å hente ut lokasjon:

```swift
locationManager = CLLocationManager()

```

- Implementer CLLocationManagerDelegate

![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/mapexample.png?raw=true)

- Implementer MKMapViewDelegate metodene viewForAnnotation & didChangeDragState for å håndetere MKPointAnnotation tegning & dragging av view

- Tips på veien:
```swift
let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
mapView.setRegion(region, animated: true)
```

- Legg til mkpointannotation
```swift
let point = MKPointAnnotation()

// Sett coordinate og title

mapView.addAnnotation(point)
```
---

# 5.5: Error handling

- Lag en validator av input. F. eks hvis tittel ikke er fylt inn
- Kan bruke UIAlertViewController eller lage et et eget error view

# 6: UILocalNotification

- Gi brukeren beskjed når han er nært en Todo med UILocalNotification

# 6: Søk på todos

- Via SearchBar eller helt egen. Be creative
