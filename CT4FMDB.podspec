Pod::Spec.new do |s|
# 名称 使用的时候pod search [name]
s.name = "CT4FMDB"
# 代码库的版本
s.version = "0.1.1"
#主页
s.homepage = "https://github.com/284766710/CT4FMDB"
# 简介
s.summary = "The easiest way to use FMDB."
# 许可证书类型，要和仓库的LICENSE 的类型一致
s.license = "MIT"
# 作者名称 和 邮箱
s.author = { "CSH" => "284766710@qq.com" }
# 代码库最低支持的版本
s.platform = :ios, "7.0"
s.ios.deployment_target = "7.0"
# 代码的Clone 地址 和 tag 版本
s.source = { :git => "https://github.com/284766710/CT4FMDB.git", :tag => "0.1.1" }
# 如果使用pod 需要导入哪些资源
s.source_files = "CT4FMDB", "CT4FMDB/**/*.{h,m}"
# 框架是否使用的ARC
s.requires_arc = true
# 核心库
s.frameworks = "Foundation","libsqlite3"
#依赖库
s.dependency "FMDB", "~> 2.6.2"

end