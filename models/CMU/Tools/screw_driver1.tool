{Tool screw_driver
  {Name screw_driver1}
  {Body {URL screw_driver1.asm}
        {Transform Homogeneous 0 -205 0
			       0.707106781 0 0.707106781
			       0.707106781 0 -0.707106781}}
  {PartFeatures 
	{Type PhillipsSlot} 
	{Type Thread}}
  {Parameters 
	#{ Width 1.5 } old parameter
	#{ Depth 1.2 } pld parameter
	{Width 1.2} 
	{Depth 2.0} 
	{Length 5}}
  {ApplicabilityCondition "expr $Width <= $PhillipsSlot(Width) && $Depth >= $PhillipsSlot(Depth)"}
  {Operation Screw
    {MotionMacro 
      #engage
       "AbsMoveTool $PhillipsSlot(Transform) RelativeTo $Part(Transform)"
       "RelMoveTool Transform Translation 0 0 -$PhillipsSlot(Depth)"
       "Attach $Tool(Name) $Part(Name)"
      #operate 
       "RelMoveTool Transform Screw 0 0 0 0 0 1 [expr -360*$Thread(Depth)*$Thread(Hand)/$Thread(Pitch)] -$Thread(Depth)"
      #disengage
       "Detach $Tool(Name) $Part(Name)"
       "RelMoveTool Transform Translation 0 0 $PhillipsSlot(Depth)"
       "Attach $Part(Name) $Subassembly(Name)"
       "AbsMoveTool $Tool(Transform)"
    }
  }
  {Operation Unscrew
    {MotionMacro 
      #engage
       "AbsMoveTool $PhillipsSlot(Transform) RelativeTo $Part(Transform)"
       "RelMoveTool Transform Translation 0 0 -$PhillipsSlot(Depth)"
       "Detach $Part(Name) $Subassembly(Name)"
       "Attach $Tool(Name) $Part(Name)"
      #operate 
       "RelMoveTool Transform Screw 0 0 0 0 0 1 [expr 360*$Thread(Depth)*$Thread(Hand)/$Thread(Pitch)] $Thread(Depth)"
      #disengage
       "Detach $Tool(Name) $Part(Name)"
       "RelMoveTool Transform Translation 0 0 $PhillipsSlot(Depth)"
       "AbsMoveTool $Tool(Transform)" 
    }
  }
  {Operation  Tighten
    {MotionMacro 
      #engage
       "AbsMoveTool $PhillipsSlot(Transform) RelativeTo $Part(Transform)"
       "RelMoveTool Transform Translation 0 0 -$PhillipsSlot(Depth)" 
      #operate 
      "Pause 3"
      #disengage
       "RelMoveTool Transform Translation 0 0 $PhillipsSlot(Depth)"
       "AbsMoveTool $Tool(Transform)"
    }
  }
  {Operation  Loosen
    {MotionMacro 
      #engage
       "AbsMoveTool $PhillipsSlot(Transform) RelativeTo $Part(Transform)"
       "RelMoveTool Transform Translation 0 0 -$PhillipsSlot(Depth)" 
      #operate 
       "Pause 3"
      #disengage
       "RelMoveTool Transform Translation 0 0 $PhillipsSlot(Depth)"
       "AbsMoveTool $Tool(Transform)"
    }
  }
}




