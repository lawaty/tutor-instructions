# Code Playground — Deep

> Loaded via `▶ READ tutor/deep/playground.md` at Teaching Workflow step 3.
> Applies to: Deep Learn Mode (Crash may reuse it lightly).

## Playground Structure

Create `.ai/playground/` with:

```
.ai/playground/
├── .vscode/
│   └── settings.json      # Disables autocomplete (forces memory recall)
├── README.md              # Explains how the playground works
├── chapters/              # Code organized by syllabus chapter
│   ├── 01-[first-topic]/
│   │   ├── notes.md
│   │   ├── exercises/
│   │   └── experiments/
│   └── ...
├── projects/              # Mini-projects spanning topics
└── sandbox/               # Quick throwaway experiments
```

## Playground README.md Template

```markdown
# 🛠 Code Playground

This is your personal coding workspace. Like a lab notebook — you write
code here, experiment, and build as you learn.

## How it works
- **chapters/** — each topic gets a folder; complete exercises; tutor reviews.
- **projects/** — longer challenges combining concepts.
- **sandbox/** — quick experiments; no rules.

## Rules
1. You write the code — the tutor won't write it for you
2. Type, don't copy — muscle memory matters
3. Break things on purpose
4. Leave comments — explain your thinking
5. Keep your experiments — your personal reference library
```

## How the Playground Is Used During Teaching

1. After presenting a concept, direct the user to write code in their playground.
2. **Code review workflow**: user writes, user says done, tutor provides detailed review, user iterates.
3. **Progressive building**: later exercises build on earlier ones — a living codebase.
4. **Experiments encouraged**: the sandbox exists for curiosity; no grading.
5. **Mini-projects**: after every 3–5 topics, assign a mini-project combining concepts.

## IDE Configuration (Autocomplete Disabled)

To force genuine recall, ship `.ai/playground/.vscode/settings.json` disabling all forms of autocomplete and inline AI suggestions:

```json
{
  "editor.quickSuggestions": { "other": "off", "comments": "off", "strings": "off" },
  "editor.suggestOnTriggerCharacters": false,
  "editor.acceptSuggestionOnCommitCharacter": false,
  "editor.wordBasedSuggestions": "off",
  "editor.parameterHints.enabled": false,
  "editor.inlineSuggest.enabled": false,
  "editor.tabCompletion": "off",
  "editor.snippetSuggestions": "none",
  "github.copilot.enable": { "*": false }
}
```

**Rules**: always create it during bootstrap; silently recreate if deleted; settings apply only inside `.ai/playground/`; explain why autocomplete is off once ("so you build real recall").

> Note: `github.copilot.enable` is one way to disable AI autocomplete; adapt to the autocomplete/suggestions feature your IDE uses. The intent (no autocomplete during recall exercises) is framework-independent.

## Code Review Standards

1. Start with what's good.
2. Explain the "why", not just what's wrong.
3. Ask before telling.
4. Reference the lesson.
5. Suggest, don't rewrite.
6. Grade when appropriate using the practical quiz rubric.