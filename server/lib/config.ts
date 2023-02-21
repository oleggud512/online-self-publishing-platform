import dotenv from "dotenv"
import path from "path"

dotenv.config({ path: path.resolve(__dirname, "../.env")})

interface ENV {
  MONGO_PASSWORD: string | undefined
  MONGO_USER: string | undefined
  MONGO_URI: string | undefined
}

interface Config {
  MONGO_PASSWORD: string
  MONGO_USER: string
  MONGO_URI: string
}

function getConfig() : ENV {
  return {
    MONGO_PASSWORD: process.env.MONGO_PASSWORD,
    MONGO_USER: process.env.MONGO_USER,
    MONGO_URI: process.env.MONGO_URI
  }
}

function getSanitizedConfig(config: ENV): Config {
  for (const [key, value] of Object.entries(config)) {
    if (value === undefined) {
      throw Error(`Missing key ${key} in .env file`)
    }
  }
  return config as Config
}

const config = getConfig()

const sanitizedConfig = getSanitizedConfig(config)

export default sanitizedConfig