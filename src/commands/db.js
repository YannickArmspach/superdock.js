import globals from '../utils/globals.js'
import { start } from '../utils/payload.js'
import { echoSuccess, echoInfo } from '../utils/echo.js'
import { exec } from '../utils/exec.js'

export default async (action, target) => {

  await start()
  
  if ( action == 'dump' ) {

    echoInfo('Start dumping database from local environement...')

    await exec('docker-compose', [
      'exec', 
      'database', 
      'sh', 
      '-c', 
      'mysqldump --no-tablespaces --host=superdock_database --user=root --password=root ' + target + ' > /superdock/databases/' + target + '.sql'
    ])

    echoSuccess('Database dumped in local directory at ' + globals.conf.dirname + '/databases/' + target + '.sql')

  } else if ( action == 'install') {

    echoInfo('Start installing database to local environement...')

    await exec('docker-compose', [
      'exec', 
      'database', 
      'sh', 
      '-c',
      'mysql -f --host=superdock_database --user=root --password=root ' + target + ' < /superdock/databases/' + target + '.sql'
    ])

    echoSuccess('Database imported in local environement')

  } else {
    
    echoError('require argument install or dump')

  }

  
 
}