# Suggested Guildelines

Here are the rules we have observed about the matchedGeometryEffect modifier:

```swift
ViewBeingShown
    // All modifiers and views you want to INCLUDE in the
    // transitioning from one view to another, you put BEFORE the
    // matchedGeometryEffect modifer.
    //
    // These will resize and reposition to the matched view.
    .shadow
    .border
    .clipShape  //  or .cornerRadius - but this modifier will be deprecated in a future version of iOS. Use `clipShape(_:style:)` or `fill(style:)` instead.
    .overlay
    .background
    .matchedGeometryEffect
    // All modifiers and views you want to EXCLUDE from the
    // transitioning from one view to another, you put AFTER the
    // matchedGeometryEffect modifier.
    .frame
    .offset

    // This is also where you want to put the destination sizing
    // and positioning modifiers you want to transition to.
    // I found unpredictable results when I don't do this.
    .sizingModifiers
    .positioningModifiers
```
