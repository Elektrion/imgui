project "imgui"
	kind "StaticLib"
	language "C++"
	staticruntime "Off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"imconfig.h", 
        "imgui.cpp", 
        "imgui.h", 
        "imgui_demo.cpp", 
        "imgui_draw.cpp", 
        "imgui_internal.h", 
        "imgui_tables.cpp", 
        "imgui_widgets.cpp", 
        "imstb_rectpack.h", 
        "imstb_textedit.h", 
        "imstb_truetype.h"
	}

    includedirs {
        "", 
        "backends", 
		"%{includedir.glfw}"
    }

    links {
        "glfw"
    }
	
	
	filter "system:windows"
		systemversion "latest"
        files {
            "backends/imgui_impl_glfw.cpp", 
            "backends/imgui_impl_glfw.h", 
            "backends/imgui_impl_opengl3.cpp", 
            "backends/imgui_impl_opengl3.h"
        }

	filter "system:macosx"
        files {
            "backends/imgui_impl_glfw.cpp", 
            "backends/imgui_impl_glfw.h", 
            "backends/imgui_impl_opengl3.cpp", 
            "backends/imgui_impl_opengl3.h"
        }
	
	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"
	
	filter "configurations:Release"
		runtime "Release"
		optimize "On"
