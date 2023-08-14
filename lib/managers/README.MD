These classes act as logic providers, except `dependency_manager` who acts as
dependency provider for abstract classes.

`dependency_manager` should be the only class that uses concrete implementations,
everyone else uses abstract ones. This makes it really easy to swap from one
concrete implementation to another, like when changing libraries or apis. 