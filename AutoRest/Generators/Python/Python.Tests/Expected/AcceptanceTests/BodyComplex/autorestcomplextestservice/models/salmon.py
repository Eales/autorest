# coding=utf-8
# --------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
#
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.
# --------------------------------------------------------------------------

from .fish import Fish


class Salmon(Fish):
    """Salmon

    :param str species:
    :param float length:
    :param list siblings:
    :param str fishtype: Polymorphic Discriminator
    :param str location:
    :param bool iswild:
    """

    _required = ['length', 'fishtype']

    _attribute_map = {
        'species': {'key': 'species', 'type': 'str'},
        'length': {'key': 'length', 'type': 'float'},
        'siblings': {'key': 'siblings', 'type': '[Fish]'},
        'fishtype': {'key': 'fishtype', 'type': 'str'},
        'location': {'key': 'location', 'type': 'str'},
        'iswild': {'key': 'iswild', 'type': 'bool'},
    }

    def __init__(self, length, species=None, siblings=None, location=None, iswild=None):
        super(Salmon, self).__init__(species=species, length=length, siblings=siblings)
        self.location = location
        self.iswild = iswild
        self.fishtype = 'salmon'
