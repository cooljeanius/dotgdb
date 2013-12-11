
###
# Hooks

define hook-run
  # Attempt to detect the target in case gdb was started with the executable
  # as an argument.
  setup-detect-target
end
document hook-run
Attempt to detect the target in case gdb was started with the executable as an argument
end

define hook-file
  # Attempt to detect the target again since a new binary has been loaded.
  setup-detect-target
end
document hook-file
Attempt to detect the target again since a new binary has been loaded.
end

define hook-core-file
  # Attempt to detect the target again since a new core has been loaded.
  setup-detect-target
end
document hook-core-file
Attempt to detect the target again since a new core has been loaded.
end

define hook-stop
  # Display instructions formats
  hookstopcpu

  # this makes 'context' be called at every BP/step
  if ($SHOW_CONTEXT > 0)
    context
  end
  if ($SHOW_NEST_INSN > 0)
    set $x = $_nest
    while ($x > 0)
      printf "\t"
      set $x = $x - 1
    end
  end
end
document hook-stop
Display instructions formats.
end

# Hooks
###
