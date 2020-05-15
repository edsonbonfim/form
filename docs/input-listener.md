# Listen for changes to an Input

In some cases, it is useful to perform a callback function whenever the text in a text field changes. For example, you may want to create a search screen with auto-complete functionality, in which you want to update the results as the user types.

How do you perform a callback function every time the text changes? With form, you have two options:

1. Provide a `onChanged()` callback to Input.
2. Using `Input.get()`.

#### Provide a onChanged() callback to Input.

The simplest approach is to provide a `onChanged()` callback to `Input`. Whenever the text changes, the callback is invoked.

In this example, print the current value of the text field on the console whenever the text changes.

```dart
Input(
  onChanged: (text) {
    print("First input: $text");
  },
);
```

#### 2. Using Input.get()

To be notified when the text changes, listen to the controller using the `addListener()` method, following the steps below:

1. Create a `tag` for `Input`.
2. Create a function to print the most recent value.
3. Listen to the controller for changes.

**Create a tag for Input**

```dart
Input("search");
```

**Create a function to print the most recent value**

You need a function to perform whenever the text changes. Create a method that prints the current value of the text field.

```dart
_printLatestValue(String text) {
  print("Second input: $text");
}
```

**Listen to the controller for changes**

Finally, listen to the changes by calling the `_printLatestValue()` method. Use the `addListener()` method for this purpose. If you wish, you can stop listening to changes at any time using the method `removeListener()`, however, form take care to automatically discard that listener when it is no longer needed, as well as attach it again if required.

!> Make sure that `Input` it has already been assembled before calling `addListener()`. Normally, if it `addListener` is called within a callback at the action of a button, or something similar, `Input` it will already be mounted, however, if you want to call `addListener` on `initState`, for example, you must place it inside `WidgetsBinding.instance.addPersistentFrameCallback()`.

```dart
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPersistentFrameCallback((_) {
    Input.get("search").addListener(_printLatestValue);
  });
}
```