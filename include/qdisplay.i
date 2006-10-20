/* $Id$ */

/** swig interface file for module qdisplay.
 *
 * \file qdisplay.i
 * \ingroup qdisplay
 */      

%module qdisplay

%{
/* ruby defines ALLOC which conflicts with boost */ 
#undef ALLOC
  
/* 
   * headers necessary to compile the wrapper
   */

#include "jafarConfig.h"
#include "qdisplay/Viewer.hpp"
#include "qdisplay/ImageItem.hpp"
#include "qdisplay/ShapeItem.hpp"
// using namespace jafar::qdisplay;

%}

#if defined(SWIGRUBY)
    %trackobjects;
    %markfunc jafar::qdisplay::Viewer "mark_Viewer";
#endif

%include "jafar.i"
%include "qdisplayException.i"
%include "qdisplay/Viewer.hpp"
%include "qdisplay/ImageItem.hpp"
%include "qdisplay/ShapeItem.hpp"

#if defined(SWIGRUBY)
%header %{

static void mark_QObject(void* ptr) {
  QObject* obj = (QObject*) ptr;

  /* Loop over each object and tell the garbage collector
    that we are holding a reference to them. */
  QList<QObject *> children = obj->findChildren<QObject *>();
  for(QList<QObject *>::iterator it = children.begin(); it != children.end(); ++it)
  {
    QObject* child = *it;
    VALUE object = SWIG_RubyInstanceFor(child);
    if (object != Qnil) {
      rb_gc_mark(object);
    }
  }
}

#include <QGraphicsScene>
#include <QGraphicsItem>

static void mark_Viewer(void* ptr) {
  mark_QObject(ptr);
  jafar::qdisplay::Viewer* obj = (jafar::qdisplay::Viewer*) ptr;

/* Loop over each object and tell the garbage collector
  that we are holding a reference to them. */
  QList<QGraphicsItem *> children = obj->scene()->items();
  for(QList<QGraphicsItem *>::iterator it = children.begin(); it != children.end(); ++it)
  {
    QGraphicsItem* child = *it;
    VALUE object = SWIG_RubyInstanceFor(child);
    if (object != Qnil) {
      rb_gc_mark(object);
    }
  }
}

%}

#endif

/*
 * headers to be wrapped goes here
 */

// %include "qdisplayTools.i"
// instantiate some print functions
// replace "Type" with appropriate class name
// %template(print) jafar::qdisplay::print<jafar::qdisplay::Type>;


