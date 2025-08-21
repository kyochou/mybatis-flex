package #(packageConfig.servicePackage);

import org.springframework.stereotype.Service;

import cn.org.kyo.admin.base.AdminBaseService;
import #(packageConfig.entityPackage).#(table.buildEntityClassName());
import #(packageConfig.mapperPackage).#(table.buildMapperClassName());

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
public class #(table.buildServiceClassName()) extends AdminBaseService<#(table.buildMapperClassName()), #(table.buildEntityClassName())> {
 
}
