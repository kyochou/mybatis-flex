package cn.org.kyo.gen;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import com.mybatisflex.codegen.config.EntityConfig;
import com.mybatisflex.codegen.config.GlobalConfig;
import com.mybatisflex.codegen.config.PackageConfig;
import com.mybatisflex.codegen.entity.Table;
import com.mybatisflex.codegen.generator.IGenerator;

import cn.org.kyo.Utils;

/**
 * data.ts 生成器
 *
 * @author kyo
 * @since 2025-08-15
 */
public class DataTsGenerator implements IGenerator {

    private String templatePath = "/templates/enjoy/data.ts.tpl";

    @Override
    public void setTemplatePath(String templatePath) {
        this.templatePath = templatePath;
    }

    @Override
    public String getTemplatePath() {
        return templatePath;
    }

    @Override
    public void generate(Table table, GlobalConfig globalConfig) {

        PackageConfig packageConfig = globalConfig.getPackageConfig();
        EntityConfig entityConfig = globalConfig.getEntityConfig();

        String path = packageConfig.getBasePackage().replace(".", "/") + "/ts";
        File file = new File(packageConfig.getSourceDir(), path + "/data/" + table.getName() + ".ts");

        if (file.exists()) {
            return;
        }

        String entityModule =  Utils.lowerFirst(entityConfig.getClassPrefix());
        String entityName = Utils.lowerFirst(table.getEntityJavaFileName());
        String entityLabel = table.getComment();

        Map<String, Object> params = new HashMap<>(4);
        params.put("entityModule", entityModule);
        params.put("entityName", entityName);
        params.put("entityLabel", entityLabel);
        params.put("table", table);
        params.put("entityConfig", entityConfig);
        params.put("packageConfig", packageConfig);
        params.put("javadocConfig", globalConfig.getJavadocConfig());

        globalConfig.getTemplateConfig().getTemplate().generate(params, templatePath, file);
        System.out.println("generate file: " + file.getAbsolutePath());
    }
}