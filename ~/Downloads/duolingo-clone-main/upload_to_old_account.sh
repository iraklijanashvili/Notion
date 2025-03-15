#!/bin/bash

# კონფიგურაცია Git-ისთვის
git config --local user.name "Irakli Janashvili"
git config --local user.email "iraklijanashvili17@gmail.com"

# შევამოწმოთ არსებობს თუ არა .git ფოლდერი
if [ -d .git ]; then
  echo "Git რეპოზიტორია უკვე ინიციალიზებულია"
else
  echo "ვიწყებ Git რეპოზიტორიის ინიციალიზაციას"
  git init
fi

# შევამოწმოთ ბრენჩი და დავარქვათ სახელი main
git branch -M main

# README.md-ის განახლება
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

git add README.md
git commit -m "1. Initial Project Structure: Update README with project description"

# ჯერ ყველა ფაილს დავამატებთ თრექინგისთვის
git add .

# ახლა ცალ-ცალკე კომიტებს შევქმნით შესაბამისი ფაილებით

# კონფიგურაცია ფაილები
git reset HEAD -- .
git add package.json package-lock.json next.config.mjs tsconfig.json postcss.config.cjs tailwind.config.ts
[ -f .eslintrc.json ] && git add .eslintrc.json
git commit -m "2. Configuration: Next.js, TypeScript and Tailwind CSS setup"

# მონაცემთა ბაზის ფაილები
git reset HEAD -- .
git add db/ drizzle.config.ts
git commit -m "3. Database Configuration: Drizzle ORM schemas and migrations"

# მონაცემთა ბაზის სკრიპტები
git reset HEAD -- .
git add scripts/
git commit -m "4. Database Scripts: Automation for seeding, production and reset operations"

# UI კომპონენტები
git reset HEAD -- .
git add components/ components.json
git commit -m "5. Core UI Components: Component system based on shadcn/ui"

# გაკვეთილების სისტემა
git reset HEAD -- .
git add app/lesson app/admin app/layout.tsx app/globals.css app/favicon.ico
git commit -m "6. Lesson System: Lesson modules, admin panel and layouts"

# მთავარი გვერდები
git reset HEAD -- .
[ -d "app/(marketing)" ] && git add "app/(marketing)/"
[ -d "app/(main)" ] && git add "app/(main)/"
git commit -m "7. Main Pages: Marketing, dashboard and learning material navigation pages"

# API მარშრუტები
git reset HEAD -- .
[ -d app/buttons ] && git add app/buttons/
[ -d app/api ] && git add app/api/
git commit -m "8. API and Interactive Elements: API routes and button components"

# სერვერის ქმედებები და ბიბლიოთეკები
git reset HEAD -- .
[ -d actions ] && git add actions/
[ -d lib ] && git add lib/
git commit -m "9. Server Actions and Libraries: Resource and user progress management functions"

# სტეიტის მართვა და დამატებითი კონფიგურაცია
git reset HEAD -- .
[ -d store ] && git add store/
[ -f middleware.ts ] && git add middleware.ts
[ -f constants.ts ] && git add constants.ts
[ -f .gitignore ] && git add .gitignore
git commit -m "10. State Management and Configuration: Zustand state management and additional config"

# დარჩენილი ფაილების დამატება
git add .
git commit -m "11. Final touches: Any remaining files"

# რემოტის დამატება მომხმარებლის ტოკენით
TOKEN="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"
GITHUB_USER="iraklijanashvili"
REPO_NAME="LinguaQuest"

git remote remove origin 2>/dev/null || true
git remote add origin "https://${GITHUB_USER}:${TOKEN}@github.com/${GITHUB_USER}/${REPO_NAME}.git"

# კოდის ატვირთვა
git push -u origin main -f

echo "ატვირთვა დასრულებულია 10 სტრუქტურული კომიტით! უსაფრთხოებისთვის, შეგიძლიათ წაშალოთ ეს სკრიპტი." 