//
//  NSDecimalNumberExtension.swift
//  BigNumber
//
//  Created by Sergey Fedortsov on 5.6.14.
//  Copyright (c) 2014 Sergey Fedortsov. All rights reserved.
//

import Foundation

operator infix ^^ {
}

func ==(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool
{
    return lhs.compare(rhs) == NSComparisonResult.OrderedSame
}

func <=(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool
{
    return !(lhs > rhs) || lhs == rhs
}

func >=(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool
{
    return lhs > rhs || lhs == rhs
}

func >(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool
{
    return lhs.compare(rhs) == NSComparisonResult.OrderedDescending
}

func <(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool
{
    return !(lhs > rhs)
}

@infix func +(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber
{
    return lhs.decimalNumberByAdding(rhs)
}

@infix func -(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber
{
    return lhs.decimalNumberBySubtracting(rhs)
}

@infix func *(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber
{
    return lhs.decimalNumberByMultiplyingBy(rhs)
}

@infix func /(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber
{
    return lhs.decimalNumberByDividingBy(rhs)
}

@infix func ^^(lhs: NSDecimalNumber, rhs: Int) -> NSDecimalNumber
{
    return lhs.decimalNumberByRaisingToPower(rhs)
}


@assignment func +=(inout lhs: NSDecimalNumber, rhs: NSDecimalNumber)
{
    lhs = lhs.decimalNumberByAdding(rhs)
}

@assignment func -=(inout lhs: NSDecimalNumber, rhs: NSDecimalNumber)
{
    lhs = lhs.decimalNumberBySubtracting(rhs)
}

@assignment func *=(inout lhs: NSDecimalNumber, rhs: NSDecimalNumber)
{
    lhs = lhs.decimalNumberByMultiplyingBy(rhs)
}

@assignment func /=(inout lhs: NSDecimalNumber, rhs: NSDecimalNumber)
{
    lhs = lhs.decimalNumberByDividingBy(rhs)
}

@assignment @prefix func ++(inout lhs: NSDecimalNumber) -> NSDecimalNumber
{
    return lhs.decimalNumberByAdding(NSDecimalNumber.one())
}

@assignment @postfix func ++(inout lhs: NSDecimalNumber) -> NSDecimalNumber
{
    let copy : NSDecimalNumber = lhs.copy() as NSDecimalNumber
    lhs = lhs.decimalNumberByAdding(NSDecimalNumber.one())
    return copy
}

@assignment @prefix func --(inout lhs: NSDecimalNumber) -> NSDecimalNumber
{
    return lhs.decimalNumberBySubtracting(NSDecimalNumber.one())
}

@assignment @postfix func --(inout lhs: NSDecimalNumber) -> NSDecimalNumber
{
    let copy : NSDecimalNumber = lhs.copy() as NSDecimalNumber
    lhs = lhs.decimalNumberBySubtracting(NSDecimalNumber.one())
    return copy
}

@prefix func -(lhs: NSDecimalNumber) -> NSDecimalNumber
{
    let minusOne: NSDecimalNumber = NSDecimalNumber(string: "-1")
    return lhs.decimalNumberByMultiplyingBy(minusOne)
}

@prefix func +(lhs: NSDecimalNumber) -> NSDecimalNumber
{
    return lhs
}
