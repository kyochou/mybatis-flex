package cn.org.kyo;

import com.mybatisflex.codegen.Generator;
import com.mybatisflex.codegen.config.GlobalConfig;
import com.mybatisflex.codegen.dialect.JdbcTypeMapping;
import com.zaxxer.hikari.HikariDataSource;

// mvn exec:java -Dexec.mainClass="cn.org.kyo.DBGenApplication" -Dspring.profiles.active=dev
public class DBGenApplication {


    public static void main(String[] args) {
        // 配置数据源
        HikariDataSource dataSource = new HikariDataSource();
        dataSource.setJdbcUrl(
            "jdbc:mysql://127.0.0.1:43306/riiixai?useInformationSchema=true&useSSL=false&useUnicode=true&characterEncoding=UTF-8&charset=utf8mb4&parseTime=True");
        dataSource.setUsername("root");
        dataSource.setPassword("root");

        // 生成 system 包
        new Generator(dataSource, createSystemConfig()).generate();

        // 关闭应用上下文
        dataSource.close();
        System.exit(0);

    }


    public static GlobalConfig createSystemConfig() {
        GlobalConfig c = createGlobalConfig();

        //设置根包
        c.getPackageConfig()
            .setBasePackage("cn.org.kyo.admin.system");

        //设置表前缀和只生成哪些表，setGenerateTable 未配置时，生成所有表
        c.getStrategyConfig()
            .setIgnoreColumns("id", "created_at", "updated_at")
            .setTablePrefix("adm_")
            .setGenerateTable("adm_user", "adm_role", "adm_organization", "adm_user_role");

        return c;
    }

    public static GlobalConfig createGlobalConfig() {
        JdbcTypeMapping.registerMapping(java.math.BigInteger.class, Long.class);
        //创建配置内容
        GlobalConfig globalConfig = new GlobalConfig();
        globalConfig.setSourceDir("/Users/kyo/projects/java/adminflex/admin/src/main/java/");

        //设置生成 entity 并启用 Lombok
        globalConfig.enableEntity()
            .setOverwriteEnable(false)
            .setWithBaseClassEnable(true)
            .setLombokNoArgsConstructorEnable(false)
            .setLombokAllArgsConstructorEnable(false)
            .setWithLombok(true)
            .setWithActiveRecord(false)
            .setJdkVersion(21);

        globalConfig.enableMapper().setOverwriteEnable(false).setMapperAnnotation(true);
        globalConfig.enableTableDef();
        globalConfig.enableService().setOverwriteEnable(true);
        globalConfig.enableServiceImpl().setOverwriteEnable(false);
        globalConfig.enableController().setOverwriteEnable(false);

        // String tplDir = System.getProperty("user.dir") + "/src/main/java/cn/org/kyo/cmd/dbgen/tpls/";
        // globalConfig.getTemplateConfig()
        // .setTemplate(new com.mybatisflex.codegen.template.impl.EnjoyTemplate())
        // .setEntity(tplDir + "entityOrBase.tpl")
        // .setMapper(tplDir + "mapper.tpl")
        // .setController(tplDir + "controller.tpl");


        return globalConfig;
    }
}
