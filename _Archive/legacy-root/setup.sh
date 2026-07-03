#!/bin/bash
# Quick setup script for pushing to GitHub

echo "🛡️  CyberSec Interview KMS - GitHub Setup"
echo "=========================================="
echo ""

# Check if git is configured
if [ -z "$(git config --global user.name)" ]; then
    echo "⚙️  Configuring Git..."
    read -p "Enter your name: " git_name
    read -p "Enter your email: " git_email
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
    echo "✅ Git configured"
else
    echo "✅ Git already configured as: $(git config --global user.name)"
fi

echo ""
echo "📂 Initializing repository..."
git init
git branch -M main

echo ""
echo "📝 Adding files..."
git add .

echo ""
echo "💾 Creating commit..."
git commit -m "Initial commit: Complete Cybersecurity Interview KMS

- Obsidian vault structure with 7 organized folders
- Templates for questions, concepts, and interview logs
- MOCs: Home, Roles, Technical Domains, Progress Dashboard  
- Sample questions: SOC Analyst, IR, Cloud Security, Behavioral
- Pre-configured plugins: Dataview, Spaced Repetition, Templater
- Company guide: CrowdStrike interview prep
- Comprehensive README with setup instructions"

echo ""
echo "🔗 Adding remote repository..."
git remote add origin https://github.com/spearsies/CyberSec-Interview-KMS.git

echo ""
echo "🚀 Pushing to GitHub..."
echo "⚠️  You'll be prompted for your GitHub credentials:"
echo "   Username: spearsies"
echo "   Password: Use your Personal Access Token (not account password)"
echo ""
echo "Need a token? Visit: https://github.com/settings/tokens"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully pushed to GitHub!"
    echo "🌐 View at: https://github.com/spearsies/CyberSec-Interview-KMS"
    echo ""
    echo "Next steps:"
    echo "1. Install Obsidian plugins (Dataview, Spaced Repetition, Templater)"
    echo "2. Start with 01_MOCs/Home.md"
    echo "3. Begin adding your interview questions"
else
    echo ""
    echo "❌ Push failed. Common issues:"
    echo "1. Using account password instead of Personal Access Token"
    echo "2. Token doesn't have 'repo' scope"
    echo "3. Network connectivity issues"
    echo ""
    echo "Create a token at: https://github.com/settings/tokens"
    echo "Then try: git push -u origin main"
fi
