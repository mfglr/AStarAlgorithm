# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from a_star_algorithm/PathMessage.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import a_star_algorithm.msg

class PathMessage(genpy.Message):
  _md5sum = "811bbae5e142336076d4597212609193"
  _type = "a_star_algorithm/PathMessage"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int32 id
int32 sizeOfNodes
NodeMessage[] nodes
================================================================================
MSG: a_star_algorithm/NodeMessage
VectorMessage location
int32 value
================================================================================
MSG: a_star_algorithm/VectorMessage
int32 x
int32 y"""
  __slots__ = ['id','sizeOfNodes','nodes']
  _slot_types = ['int32','int32','a_star_algorithm/NodeMessage[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       id,sizeOfNodes,nodes

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(PathMessage, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.id is None:
        self.id = 0
      if self.sizeOfNodes is None:
        self.sizeOfNodes = 0
      if self.nodes is None:
        self.nodes = []
    else:
      self.id = 0
      self.sizeOfNodes = 0
      self.nodes = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_2i().pack(_x.id, _x.sizeOfNodes))
      length = len(self.nodes)
      buff.write(_struct_I.pack(length))
      for val1 in self.nodes:
        _v1 = val1.location
        _x = _v1
        buff.write(_get_struct_2i().pack(_x.x, _x.y))
        _x = val1.value
        buff.write(_get_struct_i().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.nodes is None:
        self.nodes = None
      end = 0
      _x = self
      start = end
      end += 8
      (_x.id, _x.sizeOfNodes,) = _get_struct_2i().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.nodes = []
      for i in range(0, length):
        val1 = a_star_algorithm.msg.NodeMessage()
        _v2 = val1.location
        _x = _v2
        start = end
        end += 8
        (_x.x, _x.y,) = _get_struct_2i().unpack(str[start:end])
        start = end
        end += 4
        (val1.value,) = _get_struct_i().unpack(str[start:end])
        self.nodes.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_2i().pack(_x.id, _x.sizeOfNodes))
      length = len(self.nodes)
      buff.write(_struct_I.pack(length))
      for val1 in self.nodes:
        _v3 = val1.location
        _x = _v3
        buff.write(_get_struct_2i().pack(_x.x, _x.y))
        _x = val1.value
        buff.write(_get_struct_i().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.nodes is None:
        self.nodes = None
      end = 0
      _x = self
      start = end
      end += 8
      (_x.id, _x.sizeOfNodes,) = _get_struct_2i().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.nodes = []
      for i in range(0, length):
        val1 = a_star_algorithm.msg.NodeMessage()
        _v4 = val1.location
        _x = _v4
        start = end
        end += 8
        (_x.x, _x.y,) = _get_struct_2i().unpack(str[start:end])
        start = end
        end += 4
        (val1.value,) = _get_struct_i().unpack(str[start:end])
        self.nodes.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2i = None
def _get_struct_2i():
    global _struct_2i
    if _struct_2i is None:
        _struct_2i = struct.Struct("<2i")
    return _struct_2i
_struct_i = None
def _get_struct_i():
    global _struct_i
    if _struct_i is None:
        _struct_i = struct.Struct("<i")
    return _struct_i
