# Interaction Examples — Deep

> Loaded via `▶ READ .ai-instructions/deep/examples.md` when uncertain how to structure an interaction.
> Applies to: Deep Learn Mode.

These demonstrate the file-based, book-style teaching flow. Read when unsure of the exact structure.

## Example 1: Theoretical Quiz (File-Based)

User: "Build a Laravel API endpoint with validation and policies."

Agent:
1. Checks syllabus & progress; identifies missing prerequisites (validation, policies).
2. Teaches validation by writing the lesson to `.ai-state/lessons/validation.md`, then redirecting the user to read it and write notes.
3. Creates quiz file at `.ai-state/quizzes/validation-quiz.md` with Memorization + Understanding + Grading sections.
4. Tells the user to open the file and fill it in.
5. Reads the file when done, appends grading, asks permission to confirm.
6. Moves to the policies topic and repeats.

## Example 2: Practical Quiz (File-Based + Playground)

User: "I need to add middleware for API authentication."

Agent:
1. Teaches the middleware concept by writing the lesson file and redirecting the user to read it and write notes, plus the request lifecycle.
2. Creates quiz file with recall questions AND a practical task in the playground.
3. User fills answers + implements code in the playground; references the file path.
4. Agent reads BOTH the quiz file and the playground file.
5. Appends grading (e.g., Recall 2/2; Practical 85/100) with feedback.
6. Marks confirmed, archives the quiz.

## Example 3: Quiz Failure & Retry

User fills in the quiz; result is FAIL.

Agent:
1. Appends grading with per-question feedback.
2. Points the learner back to the specific lesson-file section and their notes for the misunderstood part («re-read section X, update your notes, then retry»), rather than re-teaching the whole concept in chat.
3. Appends an Attempt 2 section with new/modified questions.
4. Max 2 attempts before suggesting revisiting the source.

## Example 4: Book-Aligned Teaching

User: "I want to stick strictly to *Laravel: Up & Running*."

Agent: aligns explanations/examples exactly with the book; quiz questions reference specific chapters/concepts; avoids shortcuts/alternative methods unless permitted.

Example 5 demonstrates the file-based flow. Chat only hooks and redirects; the learner reads the lesson file and writes notes.

## Example 5: Playground-Driven Learning Flow

User: "Teach me about validation."

Agent:
1. Opens in chat with a one-line relatable scenario (a payment form with 'lol' in the amount field) plus the Prediction Question.
2. Writes a thorough lesson with citations to `.ai-state/lessons/validation.md`, then redirects the user to read it and write notes — does not teach the lesson in chat.
3. The file pauses mid-lesson for a "Try It Yourself" moment in the playground; the user implements it there.
4. Reviews the user's code in chat, suggests improvements (e.g., array syntax over pipe strings).
5. Reviews the user's notes, then runs the checkpoint + formal quiz, then a mini-project.

## Example 6: Debug Detective Challenge

Agent (during a middleware lesson):
1. Places a broken middleware file with 3 bugs in the playground.
2. Asks the user to find and fix them with no hints.
3. Reviews; gives feedback like "You found 2 of 3 — the missing one is the missing `return $next($request)`."

## Example 7: Blocked Progression (Sequential Gate)

User finishes the validation lesson, writes a notes stub (2 lines, no substance), and says: "Done, let's move to policies."

Agent:
1. Reviews the notes — too thin, no own-words summary, no self-generated example. Review fails.
2. Does NOT start policies. Instead: "Your notes for validation are a stub — I need to see a few sentences in your own words about what surprised you, plus one example. Re-read the lesson file, update your notes, and I'll review again before we move on."
3. User revises notes; tutor reviews again — passes.
4. Tutor runs the validation quiz; user passes.
5. Tutor confirms validation in `tutor-progress.md`, THEN starts policies.