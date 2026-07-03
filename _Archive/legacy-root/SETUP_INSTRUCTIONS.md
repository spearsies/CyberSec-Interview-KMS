# Setup Instructions for CyberSec-Interview-KMS

## ✅ Repository Created Successfully!

Your repository is live at: **https://github.com/spearsies/CyberSec-Interview-KMS**

However, due to authentication limitations, you'll need to push the initial files manually. Here's how:

---

## 🚀 Option 1: Clone and Add Files Locally (Recommended)

### Step 1: Download the Vault
The vault folder is available in this chat - download it to your computer.

### Step 2: Initialize and Push
Open a terminal in the downloaded folder and run:

```bash
cd CyberSec-Interview-Vault

# Configure Git (if not already done)
git config --global user.name "Stanley Spears"
git config --global user.email "your-email@example.com"

# Initialize repository
git init
git branch -M main

# Add all files
git add .

# Commit
git commit -m "Initial commit: Complete Cybersecurity Interview KMS

- Obsidian vault structure with 7 organized folders
- Templates for questions, concepts, and interview logs
- MOCs: Home, Roles, Technical Domains, Progress Dashboard  
- Sample questions: SOC Analyst, IR, Cloud Security, Behavioral
- Pre-configured plugins: Dataview, Spaced Repetition, Templater
- Company guide: CrowdStrike interview prep
- Comprehensive README with setup instructions"

# Add remote and push
git remote add origin https://github.com/spearsies/CyberSec-Interview-KMS.git
git push -u origin main
```

You'll be prompted for GitHub authentication. Use:
- Username: `spearsies`
- Password: Your GitHub Personal Access Token (not your account password)

### Creating a Personal Access Token:
1. Go to GitHub.com → Settings → Developer Settings → Personal Access Tokens → Tokens (classic)
2. Generate new token with `repo` scope
3. Copy the token and use it as your password when pushing

---

## 📥 Option 2: Use GitHub Desktop (Easiest)

1. Download GitHub Desktop: https://desktop.github.com/
2. Sign in with your GitHub account
3. File → Add Local Repository → Select the vault folder
4. Publish repository (it will detect the existing remote)
5. Commit and push all files

---

## 🎯 Option 3: Direct Upload to GitHub Website

1. Go to https://github.com/spearsies/CyberSec-Interview-KMS
2. Click "Add file" → "Upload files"
3. Drag and drop all files/folders from the vault
4. Commit with message

**Note:** This is tedious for maintaining the structure, so Options 1 or 2 are better.

---

## 📂 What's Included

The vault contains 20 files across these categories:

### Templates (3 files)
- `00_System/Templates/TQ_Question-Template.md` - Interview question template
- `00_System/Templates/TC_Concept-Template.md` - Concept template
- `00_System/Templates/TI_Interview-Log.md` - Interview tracking template

### MOCs (4 files)
- `01_MOCs/Home.md` - Main navigation hub
- `01_MOCs/Dashboard_Progress.md` - Progress tracking dashboard
- `01_MOCs/MOC_Roles.md` - Browse by role
- `01_MOCs/MOC_Technical-Domains.md` - Browse by domain

### Sample Questions (6 files)
- `02_Roles/SOC-Analyst/Q_Network_IDS-vs-IPS.md`
- `02_Roles/SOC-Analyst/Q_Fundamentals_CIA-Triad.md`
- `02_Roles/SOC-Analyst/S_Windows_Failed-Login-Investigation.md`
- `02_Roles/Incident-Response/Q_IR_NIST-Lifecycle.md`
- `03_Technical/Cloud-Security/Q_AWS_Shared-Responsibility-Model.md`
- `05_Behavioral/Q_Behavioral_Incident-Under-Pressure.md`

### Company Guides (1 file)
- `06_Companies/CrowdStrike.md`

### Configuration (4 files)
- `.obsidian/config` - Obsidian settings
- `.obsidian/plugins/dataview/data.json`
- `.obsidian/plugins/obsidian-spaced-repetition/data.json`
- `.obsidian/plugins/templater-obsidian/data.json`

### Documentation (2 files)
- `README.md` - Complete setup and usage guide
- `.gitignore` - Git ignore configuration

---

## 🔧 After Pushing to GitHub

### Clone to Obsidian Vaults Folder

```bash
# Navigate to your Obsidian vaults folder
cd ~/Documents/ObsidianVaults  # or wherever you keep vaults

# Clone the repository
git clone https://github.com/spearsies/CyberSec-Interview-KMS.git

# Open in Obsidian
# File → Open Vault → Select CyberSec-Interview-KMS
```

### Enable Version Control for Your Vault

Your interview prep is now version-controlled! Benefits:
- ✅ Track all changes to questions
- ✅ Sync across multiple devices
- ✅ Share with the community (it's public)
- ✅ Collaborate with others
- ✅ Never lose progress

---

## 🎓 Using the Vault

Once opened in Obsidian:

1. **Install Plugins** (Settings → Community Plugins):
   - Dataview
   - Spaced Repetition  
   - Templater

2. **Start at Home.md** (`01_MOCs/Home.md`)

3. **Review Dashboard** (`01_MOCs/Dashboard_Progress.md`)

4. **Add Your Questions** using templates in `00_System/Templates/`

5. **Track Interviews** in `07_Interview-Logs/`

---

## 📝 Next Steps

1. Push the vault to GitHub using one of the methods above
2. Clone it to your Obsidian vaults folder
3. Install the required plugins
4. Start adding your interview questions from Edward Jones, CrowdStrike, and other experiences
5. Use the spaced repetition system daily

---

## 🆘 Need Help?

If you run into issues:
- Check GitHub's authentication docs: https://docs.github.com/en/authentication
- Verify Git is installed: `git --version`
- Ensure you're using a Personal Access Token, not your password

---

**Repository URL:** https://github.com/spearsies/CyberSec-Interview-KMS

Good luck with your interview preparation! 🚀
