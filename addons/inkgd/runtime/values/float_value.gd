# warning-ignore-all:shadowed_variable
# warning-ignore-all:unused_class_variable
# ############################################################################ #
# Copyright © 2015-2021 inkle Ltd.
# Copyright © 2019-2022 Frédéric Maquin <fred@ephread.com>
# All Rights Reserved
#
# This file is part of inkgd.
# inkgd is licensed under the terms of the MIT license.
# ############################################################################ #

extends InkValue

class_name InkFloatValue

# ############################################################################ #

func get_value_type():
	return ValueType.FLOAT

func get_is_truthy():
	return value != 0.0

func _init():
	push_error("init float value")
	value = 0.0

# The method takes a `StoryErrorMetadata` object as a parameter that
# doesn't exist in upstream. The metadat are used in case an 'exception'
# is raised. For more information, see story.gd.
func cast(new_type, metadata = null):
	if new_type == self.value_type:
		return self

	if new_type == ValueType.BOOL:
		return BoolValue().new_with(false if value == 0 else true)

	if new_type == ValueType.INT:
		return IntValue().new_with(int(value))

	if new_type == ValueType.STRING:
		return StringValue().new_with(str(value)) # TODO: Check formating

	InkUtils.throw_story_exception(bad_cast_exception_message(new_type), false, metadata)
	return null

# ######################################################################## #
# GDScript extra methods
# ######################################################################## #

func is_ink_class(type):
	return type == "FloatValue" || super.is_ink_class(type)

func get_ink_class():
	return "FloatValue"

static func new_with(val):
	var value = FloatValue().new()
	value._init_with(val)
	return value
