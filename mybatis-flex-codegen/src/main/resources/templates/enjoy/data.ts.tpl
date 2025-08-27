#set(withLombok = entityConfig.isWithLombok())
#set(withSwagger = entityConfig.isWithSwagger())
#set(swaggerVersion = entityConfig.getSwaggerVersion())
#set(withActiveRecord = entityConfig.isWithActiveRecord())
#set(jdkVersion = entityConfig.getJdkVersion())
import mentities from '#/entities/#(entityModule)'
import { Fields } from '#/utils/entity/field'

const entity = mentities.#(entityName)
entity.fields = new Fields(entity, [
  Fields.COMMON.id(),
#for(column : table.columns)
    #if(column.name != "id" && column.name != "created_at" && column.name != "updated_at")
  {
    name: '#(underlineToCamel(column.name))',
    label: '#(column.comment ? column.comment.split(":")[0] : "")',
    formProps: {},
    searchProps: {},
    tableProps: {},
  },
    #end
#end
  Fields.COMMON.createdAt(),
])

export default entity
