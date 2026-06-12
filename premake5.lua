project "googlemock"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "On"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"googlemock/include/gmock/**.h",
    	"googlemock/src/gmock-all.cc",
		"googletest/include/gtest/**.h",
    	"googletest/src/gtest-all.cc",
	}

	includedirs
	{
		"googlemock/include",
		"googlemock",
		"googletest/include",
		"googletest"
	}

	filter "system:windows"
		systemversion "latest"

	filter "system:emscripten"
		defines
		{
			"GTEST_HAS_PTHREAD=1"
		}

		buildoptions
		{
			"-pthread",
			"-matomics",
			"-mbulk-memory",
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"