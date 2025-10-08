# UI测试框架快速入门指南

## 🚀 快速开始

### 1. 准备工作

确保您已经：
- ✅ 连接了Android设备或启动了模拟器
- ✅ 启用了USB调试
- ✅ 安装了ComposeTutorial应用

### 2. 验证设备连接

```bash
adb devices
```

应该看到您的设备列出。

### 3. 运行测试

#### 方式一：使用便捷脚本（推荐）

```bash
./run_ui_tests.sh
```

然后选择您想要运行的测试类型。

#### 方式二：直接使用Gradle命令

```bash
# 运行所有UI测试
./gradlew connectedAndroidTest

# 运行特定测试类
./gradlew connectedAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.example.composetutorial.uitest.CustomUITest

# 运行特定测试方法
./gradlew connectedAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.example.composetutorial.uitest.CustomUITest#testBasicAppLaunch
```

### 4. 查看测试结果

测试完成后，您可以：

1. **查看控制台输出** - 基本的测试结果会显示在终端中
2. **查看HTML报告** - 详细的测试报告保存在设备上
3. **查看截图** - 测试过程中的截图保存在设备上

#### 下载测试报告和截图

```bash
# 下载HTML报告
adb pull /Android/data/com.example.composetutorial/files/reports/ ./reports/

# 下载截图
adb pull /Android/data/com.example.composetutorial/files/screenshots/ ./screenshots/
```

## 📋 可用的测试用例

### 预定义测试用例

1. **基础应用启动测试** - 验证应用能够正常启动
2. **消息展开测试** - 测试消息卡片的展开/收起功能
3. **滚动测试** - 测试列表滚动功能
4. **多消息交互测试** - 测试多个消息的交互

### 演示脚本

1. **完整UI测试流程演示** - 展示框架的所有功能
2. **自定义测试用例演示** - 展示如何创建自定义测试
3. **批量测试演示** - 展示如何批量执行测试

## 🛠️ 自定义测试用例

### 创建简单的测试用例

```kotlin
val myTestCase = TestCase(
    name = "我的测试",
    description = "测试描述",
    steps = listOf(
        TestStep.LaunchApp(),
        TestStep.Wait(2000),
        TestStep.VerifyText("Android"),
        TestStep.TakeScreenshot("my_test")
    )
)
```

### 支持的测试步骤

- `LaunchApp()` - 启动应用
- `ClickText("文本")` - 点击包含指定文本的元素
- `ClickResourceId("id")` - 点击指定ID的元素
- `VerifyText("文本")` - 验证文本是否存在
- `Swipe(x1, y1, x2, y2)` - 滑动操作
- `Wait(毫秒)` - 等待指定时间
- `TakeScreenshot("名称")` - 截图
- `ScrollDown(次数)` - 向下滚动
- `ScrollUp(次数)` - 向上滚动

## 🔧 故障排除

### 常见问题

1. **设备未连接**
   ```bash
   adb devices
   # 如果没有设备，检查USB连接和调试设置
   ```

2. **应用未安装**
   ```bash
   ./gradlew installDebug
   ```

3. **权限问题**
   - 确保应用有存储权限
   - 在设备上手动授予权限

4. **测试超时**
   - 检查网络连接
   - 增加等待时间
   - 确保设备性能足够

### 调试技巧

1. **查看详细日志**
   ```bash
   ./gradlew connectedAndroidTest --info
   ```

2. **查看设备日志**
   ```bash
   adb logcat | grep "UITest"
   ```

3. **检查元素**
   - 使用UI Automator Viewer检查元素属性
   - 在测试中添加更多截图步骤

## 📊 测试报告说明

### HTML报告包含：
- 📈 测试统计概览（总数、通过数、失败数、成功率）
- 📝 每个测试用例的详细结果
- ⏱️ 执行时间统计
- 🖼️ 测试截图
- ❌ 错误信息和堆栈跟踪

### 文本报告包含：
- 简要的测试结果摘要
- 失败测试的错误信息
- 执行时间统计

## 🎯 最佳实践

1. **测试设计**
   - 保持测试用例简单明确
   - 添加适当的等待时间
   - 使用描述性的测试名称

2. **错误处理**
   - 在关键步骤后添加验证
   - 使用截图记录测试状态
   - 添加适当的错误恢复机制

3. **维护性**
   - 定期更新测试用例
   - 保持测试数据的一致性
   - 及时清理测试环境

## 📞 获取帮助

如果遇到问题：
1. 查看 `UI_TEST_README.md` 获取详细文档
2. 检查控制台输出的错误信息
3. 查看设备上的测试日志
4. 联系开发团队获取支持

---

🎉 **开始您的UI测试之旅吧！**