import fs from 'fs'
import chalk from 'chalk';
import path from 'path'
import url from 'url'

const __directory = process.cwd()
const __filename = url.fileURLToPath( import.meta.url )
const __dirname = path.dirname( __filename )

const globals = {
  superdock: [],
  services: [],
  env: [],
  path:{
    project: __directory,
    superdock: path.resolve(__dirname,'../../'),
    templates: path.resolve(__dirname,'../../src/templates'),
    services: path.resolve(__dirname,'../../src/services'),
    scripts: path.resolve(__dirname,'../../src/services/scripts'),
  },
  conf: {
    filename: '.superdock.yml',
    dirname: 'superdock',
  },
  docker: {
    file: path.resolve(__dirname,'../../src/services/docker/docker-compose.yaml')
  },
  color: {
    info: chalk.bold.cyan,
    success: chalk.bold.green,
    error: chalk.bold.red,
    warning: chalk.bold.yellow,
  },
  execa : {
    options: {
      all: true, 
      stdio: 'inherit', 
      env: { FORCE_COLOR: 'true'} 
    }
  },
}

export default globals