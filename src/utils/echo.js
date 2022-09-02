import globals from './globals.js'

/**
 * echo
 * 
 * @params message: string to display
 * @returns none
 */
export const echo = (message = '') => {

  console.log(message + '\n')

}


/**
 * echoSpacer
 * 
 * @params message: string to display
 * @returns none
 */
 export const echoSpacer = () => {

  console.log('')

}


/**
 * echoInfo
 * 
 * @params message: string to display
 * @returns none
 */
export const echoInfo = (message = '') => {

  console.log('🤖 '  + globals.color.info(message) + '\n')

}

/**
 * echoLink
 * 
 * @params message: string to display
 * @returns none
 */
 export const echoLink = (message = '') => {

  console.log('🔗 '  + globals.color.success(message) )

}

/**
 * echoSuccess
 * 
 * @params message: string to display
 * @returns none
 */
export const echoSuccess = (message = '') => {

  console.log('🎉 ' + globals.color.success(message) + '\n')

}

/**
 * echoError
 * 
 * @params message: string to display
 * @returns none
 */
 export const echoError = (message = '') => {

  console.log('💢 ' + globals.color.error(message) + '\n')

}


/**
 * echoWarning
 * 
 * @params message: string to display
 * @returns none
 */
 export const echoWarning = (message = '') => {

  console.log('⚠️  '  + globals.color.warning(message) + '\n')

}
