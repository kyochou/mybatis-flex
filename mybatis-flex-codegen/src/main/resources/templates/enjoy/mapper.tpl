package #(packageConfig.mapperPackage);

import cn.org.kyo.admin.base.AdminBaseMapper;

#if(mapperConfig.isMapperAnnotation())
import org.apache.ibatis.annotations.Mapper;
#end
import #(packageConfig.entityPackage).#(table.buildEntityClassName());

/**
 * #(table.getComment()) 映射层。
 *
#if(javadocConfig.getAuthor())
 * @author #(javadocConfig.getAuthor())
#end
#if(javadocConfig.getSince())
 * @since #(javadocConfig.getSince())
#end
 */
#if(mapperConfig.isMapperAnnotation())
@Mapper
#end
public interface #(table.buildMapperClassName()) extends AdminBaseMapper<#(table.buildEntityClassName())> {

}
