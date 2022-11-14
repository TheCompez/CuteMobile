# Auto-generated deploy QML imports script for target "CuteMobile".
# Do not edit, all changes will be lost.
# This file should only be included by qt_deploy_qml_imports().

set(__qt_opts BUNDLE)
if(arg_NO_QT_IMPORTS)
    list(APPEND __qt_opts NO_QT_IMPORTS)
endif()

_qt_internal_deploy_qml_imports_for_target(
    ${__qt_opts}
    IMPORTS_FILE "/Users/compez/Documents/GitHub/build-CuteMobile-Qt_6_4_0_for_macOS-Debug/.qt_plugins/Qt6_QmlPlugins_Imports_CuteMobile.cmake"
    PLUGINS_FOUND __qt_internal_plugins_found
    QML_DIR     "CuteMobile.app/Contents/Resources/qml"
    PLUGINS_DIR "CuteMobile.app/Contents/PlugIns"
)

if(arg_PLUGINS_FOUND)
    set(${arg_PLUGINS_FOUND} "${__qt_internal_plugins_found}" PARENT_SCOPE)
endif()
