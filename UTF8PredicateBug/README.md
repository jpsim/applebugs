# UTF8PredicateBug

## NSPredicate does not support UTF8 keypaths

[rdar://???](http://openradar.appspot.com/radar?id=???)

Please see `main.m` to see that an NSPredicate cannot reference UTF8 keypaths.

```objc
NSPredicate *frenchPredicate = [NSPredicate predicateWithFormat:@"étrange == 'ceci ne fonctionne pas'"]; // This throws an exception: 'Unable to parse the format string "..."' (displays the correct string).
```

## Steps to Reproduce

1. Create a class with a property containing letters outside 'A'->'z'. i.e. 'é'
2. Reference this keypath while constructing an NSPredicate: `[NSPredicate predicateWithFormat:@"étrange == '...'"]`
3. Run

## Expected Results

The predicate can be parsed.

## Actual Results

An exception is thrown: 'Unable to parse the format string "..."'. This exception displays the correct format string.
