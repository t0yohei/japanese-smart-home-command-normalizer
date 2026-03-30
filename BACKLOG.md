# Backlog

## Vocabulary catch-up loop

When a real voice command succeeds through fallback but is not yet encoded in the normalizer, add it in the next update.

For each successful new transcript:
1. add the raw transcript to `fixtures/samples.json`
2. map it to the confirmed intent
3. extend `lib/normalize.js` only as much as needed
4. run `node --test tests/normalize.test.js`
5. keep the rule as local and specific as possible unless multiple transcripts justify a broader pattern

## Next transcript candidates

- collect more broken cooling phrases that should normalize to `aircon_mode_cool`
- collect more broken heating phrases that should normalize to `aircon_mode_heat`
- collect more broken stop / off phrases that should normalize to `aircon_off`
- collect light on/off drift from real usage
- watch for ambiguous transcripts that should stay `needsConfirmation: true`

## Quality guardrails

- prefer fixture-first updates over ad-hoc changes
- avoid broad regex that could over-trigger the wrong device or mode
- preserve the safety bias toward confirmation when confidence is weak
- promote a broader normalization pattern only after repeated real examples
