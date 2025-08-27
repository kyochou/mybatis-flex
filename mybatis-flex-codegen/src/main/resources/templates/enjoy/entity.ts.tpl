#set(withLombok = entityConfig.isWithLombok())
#set(withSwagger = entityConfig.isWithSwagger())
#set(swaggerVersion = entityConfig.getSwaggerVersion())
#set(withActiveRecord = entityConfig.isWithActiveRecord())
#set(jdkVersion = entityConfig.getJdkVersion())
import { genEntity } from './utils'

const module = '#(entityModule)'

const #(entityName) = genEntity(module, '#(entityName)')
#(entityName).label = '#(entityLabel ? entityLabel.split(":")[0] : "")'
#(entityName).name_column = 'id'
#(entityName).newfunc = () => {
  return {}
}
