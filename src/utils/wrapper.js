import globals from './globals.js'

import fs from 'fs'
import path from 'path'
import yaml from 'yaml'
import shell from 'shelljs'

import { echo, echoError, echoInfo, echoSpacer } from './echo.js'
import check from '../utils/check.js'

/**
 * Start
 * 
 * @params checking: Check current configuration
 * @returns none
 */
export const start = async (checking = true) => {

  echoSpacer()
  echoInfo('SUPERDOCK v2.0')

  if ( checking ) await check()

  const configContent = fs.readFileSync( path.resolve(globals.path.project, './.superdock.yml'), 'utf8')

  if ( ! configContent ) echoError('Config file error')

  const superdock = await yaml.parse( configContent )

  globals.superdock = superdock.superdock
  globals.services = superdock.superdock.services
  globals.env = superdock.superdock.environements

  process.env['SUPERDOCK_PATH_PROJECT'] = globals.path.project
  process.env['SUPERDOCK_PATH_SERVICES'] = globals.path.services

  process.env['SUPERDOCK_NGINX_VERSION'] = globals.services.nginx
  process.env['SUPERDOCK_NODE_VERSION'] = globals.services.node
  process.env['SUPERDOCK_MYSQL_VERSION'] = globals.services.mysql
  process.env['SUPERDOCK_ADMINER_VERSION'] = globals.services.adminer
  process.env['SUPERDOCK_MAILHOG_VERSION'] = globals.services.mailhog
  process.env['SUPERDOCK_REDIS_VERSION'] = globals.services.redis
  process.env['SUPERDOCK_COMMANDER_VERSION'] = globals.services.commander

  process.env['SUPERDOCK_LOCAL_DOMAIN'] = globals.env.local.domain
  process.env['SUPERDOCK_LOCAL_VHOST'] = globals.env.local.vhost

  process.env['SUPERDOCK_LOCAL_UPLOADS'] = globals.env.local.uploads
  process.env['SUPERDOCK_LOCAL_DB_NAME'] = globals.env.local.db_name
  process.env['SUPERDOCK_LOCAL_DB_USER'] = globals.env.local.db_user
  process.env['SUPERDOCK_LOCAL_DB_PASS'] = globals.env.local.db_pass

}


/**
 * End
 * 
 * @params null
 * @returns none
 */
export const end = async () => {

  shell.exit()

}
