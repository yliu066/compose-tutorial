#!/bin/bash

echo "=== ComposeTutorial UI测试框架演示 ==="
echo ""

# 检查设备连接
echo "检查Android设备连接..."
adb devices

echo ""
echo "=== 可用的测试选项 ==="
echo "1. 运行基础应用启动测试"
echo "2. 运行消息展开测试"
echo "3. 运行滚动测试"
echo "4. 运行多消息交互测试"
echo "5. 运行所有预定义测试用例"
echo "6. 运行完整UI测试演示"
echo "7. 运行自定义测试用例演示"
echo "8. 运行批量测试演示"
echo ""

read -p "请选择要运行的测试 (1-8): " choice

case $choice in
    1)
        echo "运行基础应用启动测试..."
        ./gradlew connectedAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.example.composetutorial.uitest.CustomUITest#testBasicAppLaunch
        ;;
    2)
        echo "运行消息展开测试..."
        ./gradlew connectedAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.example.composetutorial.uitest.CustomUITest#testMessageExpand
        ;;
    3)
        echo "运行滚动测试..."
        ./gradlew connectedAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.example.composetutorial.uitest.CustomUITest#testScrolling
        ;;
    4)
        echo "运行多消息交互测试..."
        ./gradlew connectedAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.example.composetutorial.uitest.CustomUITest#testMultiMessageInteraction
        ;;
    5)
        echo "运行所有预定义测试用例..."
        ./gradlew connectedAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.example.composetutorial.uitest.CustomUITest#testAllPredefinedCases
        ;;
    6)
        echo "运行完整UI测试演示..."
        ./gradlew connectedAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.example.composetutorial.uitest.UITestDemo#demonstrateUITestFlow
        ;;
    7)
        echo "运行自定义测试用例演示..."
        ./gradlew connectedAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.example.composetutorial.uitest.UITestDemo#demonstrateCustomTestCase
        ;;
    8)
        echo "运行批量测试演示..."
        ./gradlew connectedAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.example.composetutorial.uitest.UITestDemo#demonstrateBatchTesting
        ;;
    *)
        echo "无效选择，运行所有测试..."
        ./gradlew connectedAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.example.composetutorial.uitest.CustomUITest
        ;;
esac

echo ""
echo "=== 测试完成 ==="
echo "测试报告和截图保存在设备的以下位置："
echo "- HTML报告: /Android/data/com.example.composetutorial/files/reports/"
echo "- 截图: /Android/data/com.example.composetutorial/files/screenshots/"
echo ""
echo "您可以使用以下命令查看设备上的文件："
echo "adb shell ls /Android/data/com.example.composetutorial/files/reports/"
echo "adb shell ls /Android/data/com.example.composetutorial/files/screenshots/"
echo ""
echo "要下载报告到本地，使用："
echo "adb pull /Android/data/com.example.composetutorial/files/reports/ ./reports/"
echo "adb pull /Android/data/com.example.composetutorial/files/screenshots/ ./screenshots/"