#pragma once

#ifndef BASE_AST_H
#define BASE_AST_H

#include <iostream>
#include <memory>
#include <string>
using namespace std;

class BaseAST {
 public:
  virtual ~BaseAST() = default;
  virtual void Dump() const = 0;
  BaseAST *next; // Use for build a link
};

class CompUnitAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> func_def;
    void Dump() const override {
    std::cout << "CompUnitAST{";
    func_def->Dump();
    std::cout << "}";
  } 
};

class FuncDefAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> func_type;
  std::string ident;
  std::unique_ptr<BaseAST> block;

  void Dump() const override
  {
    std::cout << "FuncDefAST{";
    func_type->Dump();
    std::cout << "FuncNameAST{" << ident << "}";
    block->Dump();
    std::cout << "}";
  }
};

class FuncTypeAST : public BaseAST {
 public:
  std::string *func_type;
  void Dump() const override
  {
    std::cout<<"FuncTypeAST{";
    std::cout<<*func_type;
    std::cout<< "}";
  }
};

class BlockAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> stmt;
  void Dump() const override
  {
    std::cout<<"BlockAST{";
    stmt->Dump();
    std::cout<<"}";
  }
};

class StmtAST : public BaseAST {
 public:
  std::unique_ptr<BaseAST> number;
  void Dump() const override
  {
    std::cout<<"StmtAST{";
    number->Dump();
    std::cout<<"}";
  }
};

class NumberAST : public BaseAST {
 public:
  std::string *number_const;
  void Dump() const override
  {
    std::cout<<"NumberAST{";
    std::cout<<*number_const;
    std::cout<<"}";
  }
};

#endif
