const fs = require('fs');
const path = require('path');
const vm = require('vm');

const jsDir = path.join(__dirname, '..', 'js');
const files = fs.readdirSync(jsDir).filter((file) => file.endsWith('.js')).sort();

if (files.length === 0) {
  console.error('No JavaScript files found in game/js');
  process.exit(1);
}

for (const file of files) {
  const fullPath = path.join(jsDir, file);
  const source = fs.readFileSync(fullPath, 'utf8');
  try {
    new vm.Script(source, { filename: file });
  } catch (error) {
    console.error(`Syntax validation failed for ${file}`);
    console.error(error.message);
    process.exit(1);
  }
}

console.log(`JavaScript syntax validation passed for ${files.length} files.`);
