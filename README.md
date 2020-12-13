# flutter_block_clean_tdd

A template for building flutter application

## Getting Started

This project is a starting point for a Flutter application.

## Resources

- [Clean + TDD Architecture](https://resocoder.com/flutter-clean-architecture-tdd/)
- [Bloc - a predictable state management](https://bloclibrary.dev/)
- [Open E-commerce App](https://github.com/4seer/openflutterecommerceapp)

The project template is baed on the Clean + TDD architecture. At the top level the code is divided in following layers: config, data, domain, presentation.

- config : contains all the application configuration
- data : contains all the data, remote as well as local, repositories implement all the contract of domain layer. The domain layer also contains repository which specify the contract using the abstract classes.
- domain: entities provides the data element, repository specicfy the abstract class and use cases implements the specific domain use case.
- presentation: widgets contains all the widgets, widgets are further categories as independent which is essentially all the components from the Design System Management (DSM), extension contains all the widgets which are made mixing all the independent widgets and data_driven are widgets which interact using the data from domain layer. Features contains all the screens which includes bloc, event, state and ui for each case.
