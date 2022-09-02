import globals from './globals.js'

import fs from 'fs'
import path from 'path'
import yaml from 'yaml'

import shelljs from 'shelljs'
const { chmod, mkdir, cp } = shelljs

import { echo, echoError, echoInfo, echoLink, echoSpacer } from './echo.js'
import check from '../utils/check.js'
import hosts from '../utils/hosts.js'
import cert from './cert.js'

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

  const configFile = path.resolve(globals.path.project, './.superdock.yml')

  if ( fs.existsSync(configFile) ) {
    
    const configContent = fs.readFileSync( configFile, 'utf8')

    const superdock = await yaml.parse( configContent )

    globals.superdock = superdock.superdock
    globals.services = superdock.superdock.services
    globals.projects = Object.values( superdock.superdock.projects )

    process.env['SUPERDOCK_PATH_PROJECT'] = globals.path.project
    process.env['SUPERDOCK_PATH_SERVICES'] = globals.path.services

    process.env['SUPERDOCK_NGINX_VERSION'] = globals.services.nginx
    process.env['SUPERDOCK_NODE_VERSION'] = globals.services.node
    process.env['SUPERDOCK_MYSQL_VERSION'] = globals.services.mysql
    process.env['SUPERDOCK_ADMINER_VERSION'] = globals.services.adminer
    process.env['SUPERDOCK_MAILHOG_VERSION'] = globals.services.mailhog
    process.env['SUPERDOCK_REDIS_VERSION'] = globals.services.redis
    process.env['SUPERDOCK_COMMANDER_VERSION'] = globals.services.commander

    process.env['SUPERDOCK_DOMAIN_1'] = globals.projects[0]?.local?.domain || 'project-1.superdock.dev'
    process.env['SUPERDOCK_PORT_1'] = globals.projects[0]?.local?.port || '9991'

    process.env['SUPERDOCK_DOMAIN_2'] = globals.projects[1]?.local?.domain || 'project-2.superdock.dev'
    process.env['SUPERDOCK_PORT_2'] = globals.projects[1]?.local?.port || '9992'

    process.env['SUPERDOCK_DOMAIN_3'] = globals.projects[2]?.local?.domain || 'project-3.superdock.dev'
    process.env['SUPERDOCK_PORT_3'] = globals.projects[2]?.local?.port || '9993'

    process.env['SUPERDOCK_DOMAIN_4'] = globals.projects[3]?.local?.domain || 'project-4.superdock.dev'
    process.env['SUPERDOCK_PORT_4'] = globals.projects[3]?.local?.port || '9994'

    process.env['SUPERDOCK_DOMAIN_5'] = globals.projects[4]?.local?.domain || 'project-5.superdock.dev'
    process.env['SUPERDOCK_PORT_5'] = globals.projects[4]?.local?.port || '9995'

    chmod('u+x', globals.path.scripts + '/hosts.sh')
    chmod('u+x', globals.path.scripts + '/cert.sh')
    chmod('u+x', globals.path.services + '/nginx/entrypoint/docker-entrypoint.sh')

    mkdir('-p', [
      globals.conf.dirname + '/certificates', 
      globals.conf.dirname + '/databases',
      globals.conf.dirname + '/docker',
      globals.conf.dirname + '/files',
      globals.conf.dirname + '/logs'
    ])

    cp( '-u', globals.path.templates + '/superdock/.gitignore', globals.conf.dirname );

    await hosts()

    await cert()
    
  } else {
    
    // echoError('Config file error')

  }

}

/**
 * Infos
 * 
 * @params null
 * @returns none
 */
export const infos = async () => {
  
  echoInfo('infos')

  Object.entries(globals.projects).forEach((entry) => {
    
    const [key, value] = entry;
    echoLink( key + ': https://' + value.local.domain)

  })

  echoSpacer()

  echoLink('Mysql: https://adminer.superdock.dev/')
  echoLink('Mails: https://mailhog.superdock.dev/')
  echoLink('Redis: https://rediscommander.superdock.dev/')

  echoSpacer()

}
