# japanese-smart-home-command-normalizer

A small Japanese-first normalizer for smart-home voice commands after STT.

## What it does

- normalizes common Japanese STT drift
- extracts structured slots for smart-home commands
- returns an intent, confidence, and `needsConfirmation`
- starts with `light` and `aircon`
- already has schema room for `curtain` and `tv`

## Why

For smart-home control, wrong execution is worse than a short confirmation. This package prefers fixed vocabulary and lightweight fuzzy matching over open-ended interpretation.

## Current result shape

```js
{
  rawText,
  normalizedText,
  intent,
  confidence,
  needsConfirmation,
  reason,
  slots: {
    device,
    action,
    mode,
    value,
  },
  candidates,
}
```

## Example

```js
import { classify } from './lib/normalize.js';

console.log(classify('れーぼーつけて'));
```

## Demo

```bash
node scripts/demo.js '涼しくして'
node --test tests/normalize.test.js
```

## Status

Early draft. The current focus is OpenClaw integration and fixture-driven iteration from real transcripts.
