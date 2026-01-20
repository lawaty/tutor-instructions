# Contributing to AI Tutor Instructions

Thank you for your interest in contributing! This project aims to create a robust tutoring system for AI coding assistants.

## How to Contribute

### 1. Report Issues
- Use GitHub Issues to report bugs or suggest features
- Provide clear descriptions and examples
- Tag appropriately (bug, enhancement, documentation, etc.)

### 2. Submit Example Syllabi
We welcome example syllabi for different tech stacks:
- Create a new file in `examples/syllabus-[technology].md`
- Follow the existing format
- Include authoritative sources when possible
- Submit a Pull Request

### 3. Improve Core Instructions
- Discuss major changes in an issue first
- Ensure changes align with the tutoring philosophy
- Test with real projects before submitting
- Update documentation accordingly

### 4. Documentation
- Fix typos or unclear explanations
- Add usage examples
- Improve setup instructions
- Create guides or tutorials

## Guidelines

### Philosophy
The tutor system is built on these principles:
- **Understanding over speed** - Never shortcut learning
- **Files over memory** - Track everything explicitly
- **Mastery over completion** - Learning is primary
- **Production realism** - Real-world context always

### Code Style
- Keep instructions clear and concise
- Use consistent formatting
- Include examples where helpful
- Test all scripts before submitting

### Pull Request Process
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test thoroughly
5. Commit with clear messages
6. Push to your fork
7. Open a Pull Request with description

### Commit Messages
- Use clear, descriptive messages
- Start with a verb (Add, Fix, Update, Remove, etc.)
- Reference issues when applicable

Example:
```
Add Python/Django syllabus example

- Created examples/syllabus-django.md
- Includes ORM, views, templates, and testing
- References Django official docs
```

## Testing Your Changes

### Test the Setup Script
```bash
# Create a test project
mkdir test-project && cd test-project
git init

# Run your modified setup script
/path/to/tutor-instructions/setup.sh

# Verify all files created correctly
ls -la .ai/
ls -la .github/
```

### Test Tutor Instructions
1. Use the modified instructions with an AI assistant
2. Try various scenarios (missing prerequisites, complex tasks, etc.)
3. Ensure the tutor behaves as expected
4. Document any edge cases discovered

## Example Contributions We Need

- [ ] Syllabus examples for more frameworks (Vue, Angular, Django, Flask, etc.)
- [ ] Language-specific syllabi (Go, Rust, Python, etc.)
- [ ] DevOps and cloud-focused syllabi
- [ ] Mobile development syllabi (React Native, Flutter)
- [ ] Testing frameworks and methodologies
- [ ] Improvements to the core tutor logic
- [ ] Better integration with different AI assistants
- [ ] Video tutorials or guides
- [ ] Translations to other languages

## Questions?

Open an issue with the `question` label, or start a discussion in GitHub Discussions.

## Code of Conduct

Be respectful, constructive, and helpful. We're all here to learn and improve.
