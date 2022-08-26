import { execa } from 'execa'
import globals from './globals.js'
import { echoError, echoSpacer, echoSuccess } from './echo.js'

import shelljs from 'shelljs'
const { exit } = shelljs

/**
 * exec
 * 
 * @params command: command + array options
 * @returns none
 */
export const exec = async (command = '', options = [], input = '') => {

  try {

    switch(command) {
      
      case 'docker-compose':
        await execa(
          'docker', ['compose', '-f', globals.docker.file, ...options ], 
          { ...globals.execa.options }
          ).then( result => {
            result.stdout ? console.log(result.stdout) : 'ok'
          })
        break;
      
      default:
        await execa(
          command, options, 
          { ...globals.execa.options }
          ).then( result => {
            result.stdout ? console.log(result.stdout) : 'ok'
          })
        break;

    }

    echoSpacer()

  } catch(error) {

    echoSpacer()
    echoError('Runtime error while superdock execute commands')
    exit()
  
  }

}
