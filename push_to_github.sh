#!/bin/bash

# Configure Git
git config --local user.name "Irakli Janashvili"
git config --local user.email "iraklijanashvili17@gmail.com"

# Check if .git directory exists
if [ -d .git ]; then
  echo "Git repository is already initialized"
else
  echo "Starting Git repository initialization"
  git init
fi

# Set branch to main
git branch -M main

# Create the README file if it doesn't exist
cat > README.md << 'EOL'
# LinguaQuest

An interactive language learning platform built with Next.js, React, and TypeScript.

## Features

- 🌐 Next.js 14 & server actions
- 🗣 AI Voices using Elevenlabs AI
- 🎨 Beautiful component system using Shadcn UI
- 🎭 Amazing characters
- 🔐 Auth using Clerk
- 🔊 Sound effects
- ❤️ Hearts system
- 🌟 Points / XP system
- 🔄 Practice old lessons to regain hearts
- 🏆 Leaderboard
- 🗺 Quests milestones
- 🛍 Shop system to exchange points with hearts
- 💳 Pro tier for unlimited hearts using Stripe
- 🏠 Landing page
- 📊 Admin dashboard React Admin
- 🌧 ORM using DrizzleORM
- 💾 PostgresDB using NeonDB
- 🚀 Deployment on Vercel
- 📱 Mobile responsiveness
EOL

# Add README to git
git add README.md
git commit -m "1. Initial Project Structure: Update README with project description"

# Add all files for initial commit
git add .

# Commit individual files

# Configuration files
git reset HEAD -- .
git add package.json package-lock.json next.config.mjs tsconfig.json postcss.config.cjs tailwind.config.ts
[ -f .eslintrc.json ] && git add .eslintrc.json
git commit -m "2. Configuration: Next.js, TypeScript and Tailwind CSS setup"

# Database files
git reset HEAD -- .
git add db/ drizzle.config.ts
git commit -m "3. Database Configuration: Drizzle ORM schemas and migrations"

# Database scripts
git reset HEAD -- .
git add scripts/
git commit -m "4. Database Scripts: Automation for seeding, production and reset operations"

# Core UI components
git reset HEAD -- .
git add components/ components.json
git commit -m "5. Core UI Components: Component system based on shadcn/ui"

# Lesson system
git reset HEAD -- .
git add app/lesson app/admin app/layout.tsx app/globals.css app/favicon.ico
git commit -m "6. Lesson System: Lesson modules, admin panel and layouts"

# Main pages
git reset HEAD -- .
[ -d "app/(marketing)" ] && git add "app/(marketing)/"
[ -d "app/(main)" ] && git add "app/(main)/"
git commit -m "7. Main Pages: Marketing, dashboard and learning material navigation pages"

# API routes and button components
git reset HEAD -- .
[ -d app/buttons ] && git add app/buttons/
[ -d app/api ] && git add app/api/
git commit -m "8. API and Interactive Elements: API routes and button components"

# Server actions and libraries
git reset HEAD -- .
[ -d actions ] && git add actions/
[ -d lib ] && git add lib/
git commit -m "9. Server Actions and Libraries: Resource and user progress management functions"

# State management and configuration
git reset HEAD -- .
[ -d store ] && git add store/
[ -f middleware.ts ] && git add middleware.ts
[ -f constants.ts ] && git add constants.ts
[ -f .gitignore ] && git add .gitignore
git commit -m "10. State Management and Configuration: Zustand state management and additional config"

# Final touches
git add .
git commit -m "11. Final touches: Any remaining files"

# Set remote URL with token
echo "Please enter your GitHub token:"
read -s GITHUB_TOKEN

# Set the remote URL with the token
git remote set-url origin "https://iraklijanashvili1999:${GITHUB_TOKEN}@github.com/iraklijanashvili1999/LinguaQuest.git"

# Push the code
git push -u origin main

echo "Push completed. You can now delete this script for security." 