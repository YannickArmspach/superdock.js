import { start } from '../utils/payload.js'
import { echoError, echoSuccess } from '../utils/echo.js'
import { exec } from '../utils/exec.js'

export default async (env = null) => {

  await start()

  switch(env) {

    default:
        
      echoError('Environement don\'t exist')

      break
  
  }

}