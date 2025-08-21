#set(tableComment = table.getComment())
#set(primaryKeyType = table.getPrimaryKey().getPropertySimpleType())
#set(entityClassName = table.buildEntityClassName())
#set(entityVarName = firstCharToLowerCase(entityClassName))
#set(mapperVarName = firstCharToLowerCase(table.buildMapperClassName()))
#set(serviceVarName = firstCharToLowerCase(table.buildServiceClassName()))
#set(tableDefClassName = table.buildTableDefClassName())
#set(tableClassName = tableDefConfig.buildFieldName(table.buildEntityClassName() + tableDefConfig.instanceSuffix))
package #(packageConfig.controllerPackage);

import static #(packageConfig.tableDefPackage).#(tableDefClassName).#(tableClassName);

import com.mybatisflex.core.BaseMapper;
import com.mybatisflex.core.table.TableDef;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import #(packageConfig.entityPackage).#(entityClassName);
import #(packageConfig.servicePackage).#(table.buildServiceClassName());
import #(packageConfig.mapperPackage).#(table.buildMapperClassName());
import cn.org.kyo.admin.base.CRUDController;
#if(controllerConfig.restStyle)
import org.springframework.web.bind.annotation.RestController;
#else
import org.springframework.stereotype.Controller;
#end
#if(controllerConfig.superClass != null)
import #(controllerConfig.buildSuperClassImport());
#end
#if(withSwagger && swaggerVersion.getName() == "FOX")
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
#end
#if(withSwagger && swaggerVersion.getName() == "DOC")
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
#end

/**
 * #(table.buildControllerRequestMappingPrefix())/#(tableComment)
 *
#if(javadocConfig.getAuthor())
 * @author #(javadocConfig.getAuthor())
#end
#if(javadocConfig.getSince())
 * @since #(javadocConfig.getSince())
#end
 */
#if(controllerConfig.restStyle)
@RestController
#else
@Controller
#end
#if(withSwagger && swaggerVersion.getName() == "FOX")
@Api("#(tableComment)接口")
#end
#if(withSwagger && swaggerVersion.getName() == "DOC")
@Tag(name = "#(tableComment)接口")
#end
@RequestMapping("#(table.buildControllerRequestMappingPrefix())/#(firstCharToLowerCase(modelName))")
public class #(table.buildControllerClassName()) extends CRUDController<#(entityClassName)> {

    @Autowired
    private #(table.buildServiceClassName()) #(serviceVarName);

    @Autowired
    private #(table.buildMapperClassName()) #(mapperVarName);

    @Override
    public BaseMapper<#(entityClassName)> getMapping() {
        return #(mapperVarName);
    }

    @Override
    public TableDef getTableDef() {
        return #(tableDefConfig.buildFieldName(table.buildEntityClassName() + tableDefConfig.instanceSuffix));
    }
}
