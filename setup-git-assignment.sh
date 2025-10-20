#!/bin/bash
# setup-git-assignment.sh
# Author: Ahmad Algadheeb

echo "🔧 Initializing local git repository..."
git init
git add README.md
git commit -m "Initial commit with README (commit A)"

echo "📄 Adding fileA.txt..."
git add fileA.txt
git commit -m "Add fileA.txt (commit B)"

echo "🌿 Creating feature1 branch..."
git checkout -b feature1
git add feature1.txt
git commit -m "Add feature1 (commit C)"
echo "feature1: enhancement with 1 bug" >> feature1.txt
git add feature1.txt
git commit -m "Enhance feature1 (commit D)"

echo "🔀 Merging feature1 to master..."
git checkout master
git merge --no-ff feature1 -m "Merge branch 'feature1' (commit E)"
git tag v1.0
git branch -d feature1

echo "🌿 Creating feature2 branch..."
git checkout -b feature2
git add feature2.txt
git commit -m "Add feature2 (commit F)"

echo "🐞 Creating bugfix branch..."
git checkout master
git checkout -b bugfix
sed -i 's/with 1 bug/bug fixed/' feature1.txt
git add feature1.txt
git commit -m "Fix bug in feature1 (commit G)"

echo "🔀 Merging bugfix..."
git checkout master
git merge --no-ff bugfix -m "Merge branch 'bugfix' (commit H)"
git tag v1.01
git branch -d bugfix

echo "⚡ Simulating merge conflict with feature2..."
git checkout feature2
echo "feature2 also modifies feature1 file (potential conflict)" >> feature1.txt
git add feature1.txt
git commit -m "feature2 modifies feature1 (for conflict simulation)"

git checkout master
git merge --no-ff feature2 -m "Merge branch 'feature2' (commit I)" || true
echo "feature1: enhancement bug fixed + feature2 modifications" > feature1.txt
git add feature1.txt
git commit -m "Resolve merge conflict and complete merge (commit I)"
git branch -d feature2

echo "✅ All commits and merges done!"
echo "Next step:"
echo "git remote set-url origin https://github.com/Ahmad-ccc/CS290-W23-HW7-AhmadAlgadheeb.git"
echo "git push origin master --tags"
