const fs = require('fs');
const path = require('path');

const root = path.resolve(__dirname, '..');
const requiredFiles = [
  'index.html',
  'js/application.js',
  'js/game_manager.js',
  'js/grid.js',
  'style/main.css',
  'nginx.conf',
];

for (const file of requiredFiles) {
  const fullPath = path.join(root, file);
  if (!fs.existsSync(fullPath)) {
    throw new Error(`Required file is missing: ${file}`);
  }
}

const index = fs.readFileSync(path.join(root, 'index.html'), 'utf8');
const requiredSnippets = [
  '2048',
  'js/game_manager.js',
  'js/application.js',
  'style/main.css',
];

for (const snippet of requiredSnippets) {
  if (!index.includes(snippet)) {
    throw new Error(`index.html does not include expected content: ${snippet}`);
  }
}

console.log('Smoke test passed: core 2048 static assets are present.');
