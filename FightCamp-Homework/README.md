#  FightCamp Homework

- Small summary of the reasoning behind your technical decisions.

  This project is a basic implementation of a TableView consisting of information about various packages available in the `packages.json` file.
  
  A brief summary of what's happening under the hood: 
    - It all starts when the scene delegate instantiate the RootViewController, where in `viewDidLoad` the tableView is initialised and configured. But More importantly - the DataLayer(Singleton) is used to parse the packages that are available to generate a snapshot for the `tableView`
    - The DataLayer parses each `Package` using the model and then passes it into the `PackageViewModel` where the package data is being parsed and manipulated so that we can use it directly in the TableViewCell.
    - Each TableViewCell contains elaborate information about the packages this elaborate information is shown using a custom UIView `PackageView`.
    - The PackageView is a vertical stackview consisting of various components each of which have their own `configure(with VM:PackageViewModel)` where the handoff of data into View occurs.

- A Few things to note,

  - The AutoLayout constraint issues could be improved on.
  - There are plenty of optimisations that are also possible throughout the implementation - using an ImageCache for example to prevent multiple redundant requests.
  - I also assumed that the number of included and excluded items always count to 8. Which may or may not be true but suffices for this case
