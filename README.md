# ControlToEscape.spoon

Make your <kbd>control</kbd> key act as <kbd>escape</kbd> when pressed alone and as <kbd>control</kbd> otherwise

## why this spoon
As of right now, this is the only spoon that does this correctly
- it maintains other modifiers pressed. So you can do things like <kbd>command</kbd>+<kbd>option</kbd>+<kbd>escape</kbd> (force quit apps)
- it sends <kbd>escape</kbd> immediately
- it sends it only when it was the last modifier pressed

## caps lock
I recommend using this with conjuction with remapping <kbd>caps lock</kbd> to <kbd>control</kbd> in Mac OS System Settings. No other tools necessary
