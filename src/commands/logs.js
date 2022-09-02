import { start } from '../utils/payload.js'
import { exec } from '../utils/exec.js'

export default async (options) => {

  await start()

  await exec('docker-compose', ['logs'])
  
}