#set(tableComment = table.getComment())
#set(primaryKeyType = table.getPrimaryKey().getPropertySimpleType())
#set(entityClassName = table.buildEntityClassName())
#set(entityVarName = firstCharToLowerCase(entityClassName))
#set(mapperVarName = firstCharToLowerCase(table.buildMapperClassName()))
#set(serviceVarName = firstCharToLowerCase(table.buildServiceClassName()))
#set(tableDefClassName = table.buildTableDefClassName())
#set(tableClassName = tableDefConfig.buildFieldName(table.buildEntityClassName() + tableDefConfig.instanceSuffix))

package #(packageConfig.servicePackage);

import #(packageConfig.tableDefPackage).#(tableDefClassName);
import static #(packageConfig.tableDefPackage).#(tableDefClassName).#(tableClassName);

import org.springframework.stereotype.Service;

import cn.org.kyo.admin.base.AdminBaseService;
import #(packageConfig.entityPackage).#(table.buildEntityClassName());
import #(packageConfig.mapperPackage).#(table.buildMapperClassName());
import com.mybatisflex.core.table.TableDef;

/**
 * #(table.getComment()) 服务层。
 *
#if(javadocConfig.getAuthor())
 * @author #(javadocConfig.getAuthor())
#end
#if(javadocConfig.getSince())
 * @since #(javadocConfig.getSince())
#end
 */
@Service
public class #(table.buildServiceClassName()) extends AdminBaseService<#(table.buildEntityClassName()), #(tableDefClassName), #(table.buildMapperClassName()) > {

    @Override
    public #(tableDefClassName) getTableDef() {
        return #(tableDefConfig.buildFieldName(table.buildEntityClassName() + tableDefConfig.instanceSuffix));
    }
}
